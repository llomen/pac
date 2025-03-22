"""
python+selenium爬取携程酒店数据
xiaozixi
日期：2025年03月09日
"""
import time
import random
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import NoSuchElementException, TimeoutException

# ========== 配置参数 ==========
CITY_CODE = "32"  # 广州城市代码
CHECK_IN = "2025-05-01"
CHECK_OUT = "2025-05-02"
MAX_PAGES = 3
OUTPUT_FILE = '广州酒店.csv'


# ========== 浏览器设置 ==========
def inject_cookies(driver):
    driver.get("https://www.ctrip.com")  # 先加载域名
    # 添加更多必要cookie（根据实际情况更新）
    cookies = [
        {
            'name': 'cticket',
            'value': '191A56DF004F7B36971350CCEDF20EAFC204CBF1ED293AA212225B5C5B639BCB',
            'domain': '.ctrip.com'
        },
        {
            'name': 'MKT_CK',
            'value': '1740497939016.tw7ns.2r7z',
            'domain': '.ctrip.com'
        }
    ]
    for cookie in cookies:
        driver.add_cookie(cookie)
    print("Cookie注入完成")

def init_driver():
    options = webdriver.ChromeOptions()

    # 反检测设置
    options.add_argument("--disable-blink-features=AutomationControlled")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_argument("--disable-infobars")
    options.add_argument("--start-maximized")
    options.add_argument(
        "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36")

    # 使用Service配置driver路径（修正弃用方法）
    chrome_driver_path = "C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe"
    service = Service(executable_path=chrome_driver_path)
    driver = webdriver.Chrome(service=service, options=options)

    # 屏蔽自动化特征
    driver.execute_cdp_cmd("Page.addScriptToEvaluateOnNewDocument", {
        "source": """
        Object.defineProperty(navigator, 'webdriver', {get: () => undefined});
        window.navigator.chrome = {runtime: {},};
        """
    })
    return driver


# ========== 数据解析 ==========
def parse_hotel(hotel):
    try:
        # 使用相对定位防止元素失效
        name = hotel.find_element(By.CLASS_NAME, 'hotelName').text
        price = hotel.find_element(By.CLASS_NAME, 'sale').text
        score = hotel.find_element(By.CLASS_NAME, 'score').text
        address = hotel.find_element(By.CLASS_NAME, 'position-desc').text
        print(name,price,score,address)

        return {
            '酒店名称': name,
            '价格': float(price.replace('¥', '').strip()),
            '评分': float(score),
            '地址': address,
            '入住日期': CHECK_IN
        }
    except Exception as e:
        print(f"解析错误: {str(e)}")
        return None


# ========== 页面操作 ==========
def handle_pagination(driver):
    try:
        # 新版分页按钮定位
        next_btn = WebDriverWait(driver, 15).until(
            EC.element_to_be_clickable((By.CLASS_NAME, 'list-btn-more'))
        )

        # 检查是否禁用
        if "disabled" in next_btn.get_attribute("class"):
            return False

        # 滚动到元素并点击
        driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", next_btn)
        time.sleep(random.uniform(1, 2))
        next_btn.click()
        return True
    except Exception as e:
        print(f"翻页失败: {str(e)}")
        return False


def wait_for_loading(driver):
    # 等待加载动画消失
    WebDriverWait(driver, 20).until(
        EC.invisibility_of_element_located((By.CSS_SELECTOR, 'div.loading-spinner')))
    time.sleep(random.triangular(0.8, 2.5))  # 随机等待

def scroll_until_element(driver, element_locator, max_scroll=20, scroll_wait=1.5):
    """
    持续滚动页面直到指定元素出现
    :param driver: WebDriver实例
    :param element_locator: 元素定位元组 (By策略, 选择器)
    :param max_scroll: 最大滚动尝试次数
    :param scroll_wait: 滚动间隔基础等待时间（秒）
    :return: 找到的元素对象 或 None
    """
    found_element = None
    scroll_attempt = 0

    # 人类化滚动参数
    scroll_variations = [
        {"behavior": "smooth", "block": "end"},
        {"behavior": "auto", "block": "center"},
        {"behavior": "smooth", "block": "start"}
    ]

    while scroll_attempt < max_scroll and not found_element:
        try:
            # 优先尝试直接查找元素
            found_element = WebDriverWait(driver, 3).until(
                EC.presence_of_element_located(element_locator))
            print("目标元素已存在，无需滚动")
            return found_element
        except TimeoutException:
            pass

        # 执行拟人化滚动
        scroll_config = random.choice(scroll_variations)
        driver.execute_script(
            "window.scrollTo({"
            f"top: document.documentElement.scrollHeight, "
            f"behavior: '{scroll_config['behavior']}', "
            f"block: '{scroll_config['block']}'"
            "})"
        )

        # 生成随机等待时间（带指数退避）
        current_wait = scroll_wait + (scroll_attempt * 0.3) + random.uniform(-0.5, 1.2)
        print(f"滚动第 {scroll_attempt + 1} 次，等待 {current_wait:.2f} 秒")
        time.sleep(max(0.5, current_wait))  # 确保不低于0.5秒

        # 检测元素是否出现
        try:
            found_element = WebDriverWait(driver, 3).until(
                EC.visibility_of_element_located(element_locator))
            print(f"成功找到目标元素于第 {scroll_attempt + 1} 次滚动后")
            return found_element
        except (TimeoutException, NoSuchElementException):
            scroll_attempt += 1

        # 每5次滚动后检查页面高度变化
        if scroll_attempt % 5 == 0:
            new_height = driver.execute_script("return document.body.scrollHeight")
            if new_height == driver.execute_script("return window.pageYOffset + window.innerHeight"):
                print("页面已触底但未找到元素")
                break

    # 最终尝试查找元素
    try:
        found_element = driver.find_element(*element_locator)
    except NoSuchElementException:
        print(f"经过 {max_scroll} 次滚动仍未找到目标元素")
    return found_element

    # ========== 主流程 ==========


def main():
    driver = init_driver()
    collected_data = []

    try:
        # 构建URL
        url = f"https://hotels.ctrip.com/hotels/list?city={CITY_CODE}&checkin={CHECK_IN}&checkout={CHECK_OUT}"
        inject_cookies(driver)
        driver.get(url)
        print("正在加载初始页面...")

        # 首次等待加载
        WebDriverWait(driver, 30).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, 'div.hotel-list-page'))
        )
        print("加载完成")
        current_page = 1
        while current_page <= MAX_PAGES:
            print(f"正在处理第 {current_page} 页...")

            # 模拟人类滚动
            # for _ in range(2):
            #     driver.execute_script("window.scrollBy(0, window.innerHeight * 0.8)")
            #     time.sleep(random.uniform(0.8, 1.5))

            scroll_until_element(driver,(By.CLASS_NAME, 'list-btn-more'))

            # 获取当前页酒店数据
            hotels = driver.find_elements(By.CLASS_NAME, 'right-card')
            for hotel in hotels:
                hotel_data = parse_hotel(hotel)
                if hotel_data:
                    collected_data.append(hotel_data)

            print(f"第 {current_page} 页完成，获取到 {len(hotels)} 条数据")

            # 分页处理
            if not handle_pagination(driver):
                print("没有更多分页")
                break

            wait_for_loading(driver)
            current_page += 1

    except Exception as e:
        print(f"主流程错误: {str(e)}")
        driver.save_screenshot('error_screenshot.png')
    finally:
        driver.quit()
        print("关闭浏览器")

    # 保存数据
    if collected_data:
        df = pd.DataFrame(collected_data)
        df.to_csv(OUTPUT_FILE, index=False, encoding='utf_8_sig')
        print(f"数据已保存至 {OUTPUT_FILE}，共 {len(df)} 条记录")
    else:
        print("未获取到有效数据")


if __name__ == "__main__":
    main()


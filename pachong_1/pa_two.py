"""
自动化测试
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
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import NoSuchElementException, TimeoutException

# ========== 配置参数 ==========
CITY_CODE = "2"  # 北京城市代码
CHECK_IN = "2025-05-01"
CHECK_OUT = "2025-05-02"
MAX_PAGES = 3
OUTPUT_FILE = 'ctrip_hotels.csv'


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
def parse_hotel(card):
    try:
        # 使用相对定位防止元素失效
        name = card.find_element(By.CSS_SELECTOR, 'div.hotel-name a').text.strip()
        price = card.find_element(By.CSS_SELECTOR, 'div.price span.num').text.strip()
        score = card.find_element(By.CSS_SELECTOR, 'div.score em').text.strip()
        address = card.find_element(By.CSS_SELECTOR, 'div.address span').text.strip()

        # 处理促销标签
        try:
            promo_tag = card.find_element(By.CSS_SELECTOR, 'div.promo-tag').text.strip()
        except NoSuchElementException:
            promo_tag = "无"

        return {
            '酒店名称': name,
            '价格': float(price.replace('¥', '').strip()),
            '评分': float(score),
            '地址': address,
            '促销标签': promo_tag,
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
            EC.element_to_be_clickable((By.CSS_SELECTOR, 'button.ant-pagination-next'))
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
            for _ in range(2):
                driver.execute_script("window.scrollBy(0, window.innerHeight * 0.8)")
                time.sleep(random.uniform(0.8, 1.5))

            # 获取当前页数据
            cards = WebDriverWait(driver, 20).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div.long-list ct-card'))
            )
            print(cards)
            for card in cards:
                hotel_data = parse_hotel(card)
                if hotel_data:
                    collected_data.append(hotel_data)

            print(f"第 {current_page} 页完成，获取到 {len(cards)} 条数据")

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

    # 保存数据
    if collected_data:
        df = pd.DataFrame(collected_data)
        df.to_csv(OUTPUT_FILE, index=False, encoding='utf_8_sig')
        print(f"数据已保存至 {OUTPUT_FILE}，共 {len(df)} 条记录")
    else:
        print("未获取到有效数据")


if __name__ == "__main__":
    main()
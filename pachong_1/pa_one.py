import time
import random
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# ========== 配置参数 ==========
CITY = "2"  # 目标城市
CHECKIN_DATE = "2025-03-01"  # 入住日期
CHECKOUT_DATE = "2024-03-02"  # 离店日期
MAX_PAGE = 3  # 最大爬取页数
OUTPUT_FILE = 'hotels.csv'  # 输出文件名


# ========== 浏览器配置 ==========

def inject_cookies(driver):
    driver.get("https://www.ctrip.com")  # 先加载域名
    driver.add_cookie({
        'name': 'cticket',
        'value': '191A56DF004F7B36971350CCEDF20EAFC204CBF1ED293AA212225B5C5B639BCB',
        'domain': '.ctrip.com'
    })
    driver.add_cookie({
        'name': 'MKT_CK',
        'value': '1740497939016.tw7ns.2r7z',
        'domain': '.ctrip.com'
    })
    print("Cookie注入完成")

def init_driver():
    options = webdriver.ChromeOptions()

    # 反爬关键设置
    options.add_argument("--disable-blink-features=AutomationControlled")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_argument("--disable-infobars")
    options.add_argument("--start-maximized")  # 最大化窗口避免响应式布局

    # 指定driver路径
    chrome_driver = "C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe"
    driver = webdriver.Chrome(executable_path=chrome_driver)

    # 修改WebDriver属性（避开基础检测）
    driver.execute_cdp_cmd(
        "Page.addScriptToEvaluateOnNewDocument", {
            "source": """
            Object.defineProperty(navigator, 'webdriver', {
              get: () => undefined
            })
            """
        })
    return driver


# ========== 数据解析 ==========
def parse_hotel(driver):
    hotels = []
    items = driver.find_elements(By.CSS_SELECTOR, 'div.searchresult_list div.hotel_item')

    for item in items:
        try:
            # 使用相对定位避免元素失效
            name = item.find_element(By.CSS_SELECTOR, 'a[data-tag="hotelName"]').text.strip()
            price = item.find_element(By.CSS_SELECTOR, 'div.J_price span.num').text.strip()
            score = item.find_element(By.CSS_SELECTOR, 'span.hotel_value').text.strip()
            address = item.find_element(By.CSS_SELECTOR, 'p.hotel_item_htladdress').text.strip()

            hotels.append({
                '酒店名称': name,
                '价格': float(price),
                '评分': float(score),
                '地址': address,
                '入住日期': CHECKIN_DATE
            })
        except Exception as e:
            print(f"数据解析异常: {str(e)}")
            continue

    return hotels


# ========== 主流程 ==========
def main():

    driver = init_driver()
    all_hotels = []

    try:
        # 构造初始URL
        base_url = f"https://hotels.ctrip.com/hotels/list?city={CITY}&checkIn={CHECKIN_DATE}&checkOut={CHECKOUT_DATE}"
        inject_cookies(driver)
        driver.get(base_url)

        for page in range(1, MAX_PAGE + 1):
            try:
                # 显式等待加载完成（关键！）
                WebDriverWait(driver, 15).until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, 'div.searchresult_list')))

                # 解析当前页数据
                current_hotels = parse_hotel(driver)
                all_hotels.extend(current_hotels)
                print(f"第{page}页完成，获取{len(current_hotels)}条数据")

                # 模拟人工滚动
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight*0.8);")
                time.sleep(random.uniform(1, 3))

                # 点击下一页（适配最新页面结构）
                next_btn = driver.find_element(By.CSS_SELECTOR, 'a.next')
                if "disabled" in next_btn.get_attribute("class"):
                    print("已达最后一页")
                break

                driver.execute_script("arguments[0].click();", next_btn)
                time.sleep(random.uniform(3, 6))  # 模拟人工翻页间隔

            except Exception as e:
                print(f"第{page}页处理异常: {str(e)}")
                break

    finally:
        driver.quit()

    # 保存数据
    if all_hotels:
        df = pd.DataFrame(all_hotels)
        df.to_csv(OUTPUT_FILE, index=False, encoding='utf_8_sig')
        print(f"数据已保存至 {OUTPUT_FILE}")
    else:
        print("未获取到有效数据")


if __name__ == "__main__":
    main()
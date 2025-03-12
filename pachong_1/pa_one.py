import time
import random
import re
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service  # 新增Service导入
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# ========== 配置参数 ==========
CITY = "2"  # 目标城市
CHECKIN_DATE = "2025-05-01"  # 入住日期
CHECKOUT_DATE = "2025-05-02"  # 离店日期
MAX_PAGE = 3  # 最大爬取页数
OUTPUT_FILE = 'hotels.csv'  # 输出文件名


# ========== 浏览器配置 ==========
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
    options.add_argument("--disable-blink-features=AutomationControlled")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_argument("--disable-infobars")
    options.add_argument("--start-maximized")

    # 使用Service配置driver路径（修正弃用方法）
    chrome_driver_path = "C:\Program Files (x86)\Google\Chrome\Application\chromedriver.exe"
    service = Service(executable_path=chrome_driver_path)
    driver = webdriver.Chrome(service=service, options=options)

    # 反检测脚本
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
    items = driver.find_elements(By.CSS_SELECTOR, '#ibu_hotel_container > div > section > div.list-content')
    driver.find_elements(By.XPATH)

    for item in items:
        try:
            name = item.find_element(By.XPATH, '//*[@id="ibu_hotel_container"]/div/section/div[2]/ul/li[5]/div/div[2]/div[1]/div[1]/div/span[1]').text.strip()

            # 价格处理（移除非数字字符）
            price_element = item.find_element(By.XPATH, '//*[@id="ibu_hotel_container"]/div/section/div[2]/ul/li[5]/div/div[2]/div[2]/div[2]/div[1]/div[2]/span[2]')
            price = float(re.sub(r'[^\d.]', '', price_element.text))

            # 评分处理
            score_element = item.find_element(By.XPATH, '//*[@id="ibu_hotel_container"]/div/section/div[2]/ul/li[5]/div/div[2]/div[1]/div[2]/div/div[1]/div/span')
            score = float(score_element.text.strip())

            address = item.find_element(By.XPATH, '//*[@id="ibu_hotel_container"]/div/section/div[2]/ul/li[5]/div/div[2]/div[1]/div[3]/span[1]').text.strip()

            hotels.append({
                '酒店名称': name,
                '价格': price,
                '评分': score,
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
        base_url = f"https://hotels.ctrip.com/hotels/list?city={CITY}&checkIn={CHECKIN_DATE}&checkOut={CHECKOUT_DATE}"
        inject_cookies(driver)
        driver.get(base_url)

        for page in range(1, MAX_PAGE + 1):
            try:
                # 显式等待加载完成
                WebDriverWait(driver, 20).until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, 'div.hotel-list-page')))

                # 解析数据
                current_hotels = parse_hotel(driver)
                all_hotels.extend(current_hotels)
                print(all_hotels,'hotel data')
                print(f"第{page}页完成，获取{len(current_hotels)}条数据")

                # 模拟人工操作
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight*0.8);")
                time.sleep(random.uniform(1.5, 3))

                # 分页处理（修正逻辑错误）
                next_btn = WebDriverWait(driver, 15).until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, 'a.next')))

                if "disabled" in next_btn.get_attribute("class"):
                    print("已达最后一页")
                    break

                # 点击下一页
                driver.execute_script("arguments[0].click();", next_btn)
                time.sleep(random.uniform(3, 6))  # 增加等待时间

            except Exception as e:
                print(f"第{page}页处理异常: {str(e)}")
                break

    finally:
        driver.quit()

    # 保存数据
    if all_hotels:
        df = pd.DataFrame(all_hotels).drop_duplicates()  # 去重处理
        df.to_csv(OUTPUT_FILE, index=False, encoding='utf_8_sig')
        print(f"共获取{len(df)}条数据，已保存至 {OUTPUT_FILE}")
    else:
        print("未获取到有效数据")


if __name__ == "__main__":
    main()
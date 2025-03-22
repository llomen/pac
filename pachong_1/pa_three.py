"""
自动化测试
xiaozixi
日期：2025年03月15日
非正式版
"""
import requests
import time
import random


# ========== 核心参数配置 ==========
CITY_ID = 1  # 北京的城市编号
CHECK_IN = "2024-03-20"
CHECK_OUT = "2024-03-22"
MAX_PAGE = 5  # 最大采集页数



# ========== 请求函数 ==========
def get_hotel_list(page):
    url = "https://m.ctrip.com/restapi/soa2/31454/json/fetchHotelList"

    params = {
        "cityId": CITY_ID,
        "pageIndex": page,
        "checkIn": CHECK_IN,
        "checkOut": CHECK_OUT,
        "sort": 0,
        "_timestamp": int(time.time() * 1000)
    }

    try:
        resp = requests.get(
            url,
            params=params,
            timeout=10
        )
        return resp.json()['data']['hotelList']
    except Exception as e:
        print(f"请求失败: {str(e)}")
        return []


# ========== 数据解析 ==========
def parse_hotel(hotel_data):
    return {
        "酒店名称": hotel_data.get("hotelName"),
        "最低价格": hotel_data.get("lowestPrice"),
        "评分": hotel_data.get("score"),
        "地址": hotel_data.get("address"),
        "经纬度": f"{hotel_data.get('longitude')},{hotel_data.get('latitude')}"
    }


# ========== 主程序 ==========
if __name__ == "__main__":
    all_hotels = []

    for page in range(1, MAX_PAGE + 1):
        print(f"正在采集第 {page} 页...")
        hotels = get_hotel_list(page)

        if not hotels:
            print("未获取到数据，可能触发反爬")
            break

        all_hotels.extend([parse_hotel(h) for h in hotels])
        time.sleep(random.uniform(3, 6))  # 随机延迟

    print(f"共获取到 {len(all_hotels)} 条数据")
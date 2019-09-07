//
//  Stocks.swift
//  PeopleAndAppleStockPrices
//
//  Created by God on 9/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
//struct StocksWrapper: Codable {
//    let resultStocks: [Stocks]
//}
struct Stocks: Codable {
    let date: String
    let changePercent: Double
    let open: Double
    let close: Double
    let change: Double
}

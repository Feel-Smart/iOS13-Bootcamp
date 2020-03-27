//
//  CoinData.swift
//  ByteCoin
//
//  Created by Matthew Musgrove on 3/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String // currency
    let asset_id_quote: String // crypto currency
    let rate: Double // price of crypto currently
}

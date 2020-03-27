//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Matthew Musgrove on 3/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let currency: String
    let crypto: String
    let price: Double
    
    var priceString: String {
        return String(format: "%.2f", price)
    }
    
}

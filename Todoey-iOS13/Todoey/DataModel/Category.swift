//
//  Category.swift
//  Todoey
//
//  Created by Matthew Musgrove on 3/25/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    @objc dynamic var bgColor : String = "000000"
}

//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by Matthew Musgrove on 3/11/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct Message {
    let sender: String
    let body: String
    
    init(from sender: String, body: String){
        self.sender = sender
        self.body = body
    }
}

//
//  FlowerManager.swift
//  WhatFlower
//
//  Created by Matthew Musgrove on 3/31/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol FlowerManagerDelegate {
    func didFetchFlower(_ flowerManager: FlowerManager,_ flower: FlowerModel)
    func didFailWithError(error: Error)
}

struct FlowerManager{
    
    var delegate: FlowerManagerDelegate?
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    var flowerName = ""
    
    func requestInfo(flowerName: String){
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pinthumbsize" : "500"
        ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                
                let flowerJSON : JSON = JSON(response.result.value!)
                
                let pageID = flowerJSON["query"]["pageids"][0].stringValue
                
                let flowerDescription = flowerJSON["query"]["pages"][pageID]["extract"].stringValue
                
                let flowerImageURL = flowerJSON["query"]["pages"][pageID]["thumbnail"]["source"].stringValue
                
                let flower = FlowerModel(name: flowerName, description: flowerDescription, imageURL: flowerImageURL)
                
                self.delegate?.didFetchFlower(self, flower)
                
            }
        }
    }
    
}

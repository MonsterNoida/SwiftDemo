//
//  Parser.swift
//  swift-1
//
//  Created by Sharad Saxena on 21/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation
import UIKit

public class Parser {
    
    static let sharedInstance = Parser()
    
    public static func parseData(data: Data) -> Array<Any> {
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Dictionary<String, String>>

        var productArray = [ProductModel]()
        
        for item in json!
        {
            let productModel = ProductModel()
            productModel.product = item["product"]
            productModel.cost = item["cost"]
            
            productArray.append(productModel)
        }
        
        return productArray
    }
    
}

//
//  ServiceManager.swift
//  swift-1
//
//  Created by Gaurav Srivastava on 21/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ServiceManager {

    func callApi(name:String, completionHandler: @escaping (_: Array<Any>?, _:Error?) -> Void) {
        // prepare the request object, and call using URLSession
        
        let todoEndpoint: String = "https://api.myjson.com/bins/vkgwr"
        guard let urlRequest = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let request = URLRequest(url: urlRequest)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            let productArray = Parser.parseData(data: data!) as Array<Any>!
            completionHandler(productArray!, error)
        }
        task.resume()
    }
}

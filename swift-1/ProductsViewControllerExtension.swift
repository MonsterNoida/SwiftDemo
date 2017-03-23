//
//  ProductsViewControllerExtension.swift
//  swift-1
//
//  Created by Sharad Saxena on 23/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation
import UIKit
extension ProductsViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        print(row)
        stopActivityIndicator()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "cell")
        let productModel = prodArr[indexPath.row] as! ProductModel
        
        cell.textLabel?.text = productModel.product! + " And cost is " + productModel.cost!
        
        return cell
    }

}

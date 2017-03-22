//
//  ProductsViewController.swift
//  swift-1
//
//  Created by Gaurav Srivastava on 20/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var fullNameLabel:UILabel!
    @IBOutlet weak var tableview:UITableView!
    public var prodArr :Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = "Welcome " + UserModel.sharedInstance.fullName! + "!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

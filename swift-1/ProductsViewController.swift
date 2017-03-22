//
//  ProductsViewController.swift
//  swift-1
//
//  Created by Gaurav Srivastava on 20/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var fullNameLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = "Welcome " + UserModel.sharedInstance.fullName! + "!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

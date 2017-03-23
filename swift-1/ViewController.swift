//
//  ViewController.swift
//  swift-1
//
//  Created by Gaurav Srivastava on 20/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullNameTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapGetProducts(sender:AnyObject) {

        activityIndicatorTag = 100
        startActivityIndicator();
        UserModel.sharedInstance.fullName = fullNameTextField.text!
        
        callServiceManager(fullName: UserModel.sharedInstance.fullName!)
    }
    
    func callServiceManager(fullName:String) {
        //calling ServiceManager
        
        let serviceManager = ServiceManager()
        serviceManager.callApi(name: fullName) { (productArray, error) in
            guard productArray != nil else
            {
                print("productArray error")
                return
            }
            weak var weakSelf = self
            weakSelf?.stopActivityIndicator()
            DispatchQueue.main.async {
                // after response
                let productsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
                
                self.navigationController?.pushViewController(productsViewController, animated: true)
                productsViewController.prodArr = productArray!                
            }
        }
    }
}

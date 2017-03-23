//
//  UIViewControllerExtension.swift
//  swift-1
//
//  Created by Sharad Saxena on 23/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC.runtime
// Declare a global var to produce a unique address as the assoc object handle
var AssociatedObjectHandle: UInt8 = 0
/**
 * Policies related to associative references.
 * These are options to objc_setAssociatedObject()
 */
enum objc_AssociationPolicy : UInt {
    
    case OBJC_ASSOCIATION_ASSIGN
    case OBJC_ASSOCIATION_RETAIN_NONATOMIC
    
    case OBJC_ASSOCIATION_COPY_NONATOMIC
    
    case OBJC_ASSOCIATION_RETAIN
    
    case OBJC_ASSOCIATION_COPY
}

extension UIViewController
{
    //set tag for activity indicator

   // var activityIndicatorTag: Int { return 999999 }
    

    var activityIndicatorTag: Int
        {
        set
        {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get
        {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as! Int
        }
    }

    func startActivityIndicator(
        style: UIActivityIndicatorViewStyle = .gray,
        location: CGPoint? = nil) {
        
        //Set the position - defaults to `center` if no`location`
        
        //argument is provided
        
        let loc = location ?? self.view.center
        
        //Ensure the UI is updated from the main thread
        
        //in case this method is called from a closure
        //Create the activity indicator

        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            //Add the tag so we can find the view in order to remove it later
            
            activityIndicator.tag = self.activityIndicatorTag
            //Set the location
            
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            //Start animating and add the view
            
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }

    
    func stopActivityIndicator() {
        
        //Again, we need to ensure the UI is updated from the main thread!
        
        DispatchQueue.main.async {
            //Here we find the `UIActivityIndicatorView` and remove it from the view
            
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}

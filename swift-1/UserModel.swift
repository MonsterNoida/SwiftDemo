//
//  UserModel.swift
//  swift-1
//
//  Created by Gaurav Srivastava on 20/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

public class UserModel: NSObject {
    
    private override init() {
    
    }
    
    static let sharedInstance = UserModel()
    
    var fullName: String?
}

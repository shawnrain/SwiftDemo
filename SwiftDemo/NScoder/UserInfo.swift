//
//  UserInfo.swift
//  NSCoder
//
//  Created by MTShawn on 2018/12/19.
//  Copyright © 2018 MT. All rights reserved.
//

import UIKit

class UserInfo: NSObject,NSCoding{
    var name : String
    var phone : String
    
    required init(name:String = "",phone:String = "") {
        self.name = name
        self.phone = phone
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(phone, forKey: "Phone")
    }
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "Name") as? String ?? ""
        self.phone = aDecoder.decodeObject(forKey: "Phone") as? String ?? ""
    }
    

}

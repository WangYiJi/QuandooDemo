//
//  UserPost.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import ObjectMapper

class UserPost: NSObject,Mappable {
    var userId:CLong?
    var id:CLong?
    var title:String?
    var body:String?
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}

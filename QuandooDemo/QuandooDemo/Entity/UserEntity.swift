//
//  UserEntity.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/2.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import ObjectMapper

class UserEntity: NSObject,Mappable {
    var id:CLong?
    var name:String?
    var username:String?
    var email:String?
    var address:address?
    var phone:String?
    var website:String?
    var company:company?
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        company <- map["company"]
    }
    
    //User’s address (street, suite, city and zip code)
    func userFullAddress() -> String {
        var sAddress = ""
        if let sStreet = address?.street {
            sAddress.append(sStreet)
        }
        if let sSuite = address?.suite {
            sAddress.append(" \(sSuite)")
        }
        if let sCity = address?.city {
            sAddress.append(" \(sCity)")
        }
        if let sZipCode = address?.zipcode {
            sAddress.append(" \(sZipCode)")
        }
        return sAddress
    }
}

class address: NSObject,Mappable {
    var street:String?
    var suite:String?
    var city:String?
    var zipcode:String?
    var geo:geo?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
    }
}

class geo:NSObject,Mappable {
    var lat:String?
    var lng:String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
    }
}

class company: NSObject,Mappable {
    var name:String?
    var catchPhrase:String?
    var bs:String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
}

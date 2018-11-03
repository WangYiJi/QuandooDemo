//
//  UserPostViewModel.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class UserPostViewModel: NSObject {
    //Dynamic variable can be observed
    @objc dynamic var userPostList:[UserPost] = []
    
    //Fetch user posts by user id
    public func requestPostWithUserId(userId:CLong) -> Void {
        NetworkCenter.requestUserPostWithUserId(userId: userId, successBlock: { (response) in
            //KVO
            self.userPostList = response
        }) { (error) in
            print(error)
        }
    }
}

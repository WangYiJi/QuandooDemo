//
//  UserListViewModel.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class UserListViewModel: NSObject {
    //Dynamic variable can be observed
    @objc dynamic var userList:[UserEntity] = []
    
    public func requestGetUserList() -> Void {
        NetworkCenter.requestUserList(successBlock: { (response) in
            //KVO
            self.userList = response
        }) { (error) in
            print(error)
        }
    }
}

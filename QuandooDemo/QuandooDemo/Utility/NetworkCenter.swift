//
//  NetworkCenter.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/2.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


let baseURL = "https://jsonplaceholder.typicode.com"


typealias requestFail = (String) -> ()

class NetworkCenter: NSObject {
    
    //Fetch user list from API
    static func requestUserList(successBlock: @escaping (_ users:[UserEntity])->Void, failBlock:@escaping requestFail) -> Void {
        
        let url = "\(baseURL)/users"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseArray { (respsone:DataResponse<[UserEntity]>) in
            switch respsone.result {
            case .success:
                if let result = respsone.result.value {
                    successBlock(result)
                }
            case .failure(let error):
                failBlock(error.localizedDescription)
            }
        }
    }
    
    //Fetch user posts from API by user id
    static func requestUserPostWithUserId(userId:CLong, successBlock: @escaping (_ users:[UserPost])->Void, failBlock:@escaping requestFail) -> Void {
        
        let url = "\(baseURL)/posts"
        
        Alamofire.request(url, method: .get, parameters: ["userId":userId], encoding: URLEncoding.default, headers: nil).validate().responseArray { (respsone:DataResponse<[UserPost]>) in
            switch respsone.result {
            case .success:
                if let result = respsone.result.value {
                    successBlock(result)
                }
            case .failure(let error):
                failBlock(error.localizedDescription)
            }
        }
    }
    
    
}

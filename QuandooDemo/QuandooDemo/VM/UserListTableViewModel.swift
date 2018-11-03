//
//  UserListTableViewModel.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

let DEFUSERLIST = "userList"

protocol UserListTableViewDelegate:NSObjectProtocol {
    func reloadUserList()
    func showUserPosts(userId:CLong)
}

class UserListTableViewModel: NSObject {
    var tableviewID:String = ""
    var userlistVM:UserListViewModel!
    
    private var myContext = 0
    weak var delegate:UserListTableViewDelegate?
    
    init(identifier:String,viewModel:UserListViewModel) {
        super.init()
        
        self.tableviewID = identifier
        self.userlistVM = viewModel
        
        //binding viewmodel KVO
        self.bindViewModel()
        
        //Reuqest data from API
        self.userlistVM.requestGetUserList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Detach KVO when deinit
    deinit {
        self.userlistVM.removeObserver(self, forKeyPath: DEFUSERLIST)
    }
    
    //KVO
    func bindViewModel() -> Void {
        self.userlistVM.addObserver(self, forKeyPath: DEFUSERLIST, options: [.new, .old], context: &myContext)
    }
}

//MARK: Tableview delegate and dataSource
extension UserListTableViewModel:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userlistVM.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserListCell = tableView.dequeueReusableCell(withIdentifier: tableviewID) as! UserListCell
        
        if self.userlistVM.userList.count > indexPath.row {
            let userItem = self.userlistVM.userList[indexPath.row]
            cell.setUpWithUserInfo(userInfo: userItem)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.userlistVM.userList.count > indexPath.row {
            //If let for saftly. avoid use force unwrap
            if let userId = self.userlistVM.userList[indexPath.row].id{
                self.delegate?.showUserPosts(userId: userId)
            }
        }
    }
}

//MARK: KVO
extension UserListTableViewModel {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == DEFUSERLIST {
            
            //Use Main thread call UI
            DispatchQueue.main.async { [weak self] in
                
                self?.delegate?.reloadUserList()
            }
        }
    }
}

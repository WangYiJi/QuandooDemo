//
//  UserPostsTableViewModel.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

let DEFUSERPOST = "userPostList"

protocol UserPostsTableViewModelDelegate:NSObjectProtocol {
    func reloadPostsList()
}

class UserPostsTableViewModel: NSObject {
    var tableviewID:String = ""
    var userPostVM:UserPostViewModel!
    
    private var myContext = 0
    
    weak var delegate:UserPostsTableViewModelDelegate?
    
    init(userId:CLong,identifier:String,viewModel:UserPostViewModel) {
        super.init()
        
        self.tableviewID = identifier
        self.userPostVM = viewModel
        self.bindViewModel()
        
        self.userPostVM.requestPostWithUserId(userId: userId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.userPostVM.removeObserver(self, forKeyPath: DEFUSERPOST)
    }
    
    func bindViewModel() -> Void {
        self.userPostVM.addObserver(self, forKeyPath: DEFUSERPOST, options: [.new, .old], context: &myContext)
    }
}

//MARK: Tableview delegate and dataSource
extension UserPostsTableViewModel:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userPostVM.userPostList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserPostCell = tableView.dequeueReusableCell(withIdentifier: tableviewID) as! UserPostCell
        
        if self.userPostVM.userPostList.count > indexPath.row {
            let postItem = self.userPostVM.userPostList[indexPath.row]
            cell.setUpPostInfo(post: postItem)
        }
        return cell
    }
    
}

//MARK: KVO
extension UserPostsTableViewModel {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == DEFUSERPOST {
            
            //Use Main thread call UI
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.reloadPostsList()
            }
        }
    }
}

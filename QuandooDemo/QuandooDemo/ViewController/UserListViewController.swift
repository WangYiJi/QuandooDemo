//
//  UserListViewController.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

let KUSERLISTCELL = "UserListCell"
let KPOSTLISTSEGUE = "Show Post List"

class UserListViewController: UIViewController {
    var userListTableVM:UserListTableViewModel!
    var userListVM:UserListViewModel!
    
    @IBOutlet weak var mainTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User List"
        
        //Dynamical cell height
        self.mainTableview.estimatedRowHeight = 60
        self.mainTableview.rowHeight = UITableView.automaticDimension
        
        //Setup ViewModel and tableviewModel
        self.userListVM = UserListViewModel.init()
        
        self.userListTableVM = UserListTableViewModel.init(identifier: KUSERLISTCELL, viewModel: self.userListVM)
        self.userListTableVM.delegate = self
        
        //Register costom cell
        self.mainTableview.register(UserListCell.self, forCellReuseIdentifier: KUSERLISTCELL)
        
        //Setup tableview delegate and dataSource
        self.mainTableview.delegate = self.userListTableVM
        self.mainTableview.dataSource = self.userListTableVM
    }
}

extension UserListViewController:UserListTableViewDelegate {
    //After fetch date
    func reloadUserList() {
        self.mainTableview.reloadData()
    }
    
    //When select user. push to user posts view
    func showUserPosts(userId: CLong) {
        self.performSegue(withIdentifier: KPOSTLISTSEGUE, sender: userId)
    }
}

//Delivery userId when push to user posts view
extension UserListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == KPOSTLISTSEGUE {
            let postsVC = segue.destination as? UserPostsViewController
            postsVC?.selectUserId = sender as? CLong
        }
    }
}

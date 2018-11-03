//
//  UserPostsViewController.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

let KUSERPOSTCELL = "UserPostCell"

class UserPostsViewController: UIViewController {
    var selectUserId:CLong?
    var userPostsTableVM:UserPostsTableViewModel!
    var userPostsVM:UserPostViewModel!
    
    @IBOutlet weak var mainTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Posts"
        
        //Setup back button at left bar
        let backBar = UIBarButtonItem.init(title: "Back", style: .plain, target: self, action: #selector(didPressedBack))
        self.navigationItem.leftBarButtonItem = backBar
        
        //Dynamical cell height
        self.mainTableview.estimatedRowHeight = 50
        self.mainTableview.rowHeight = UITableView.automaticDimension
        
        //Setup viewModel
        self.userPostsVM = UserPostViewModel()
        
        //If let for safety, avoid force unwrap
        if let userId = self.selectUserId {
            self.userPostsTableVM = UserPostsTableViewModel.init(userId: userId, identifier: KUSERPOSTCELL, viewModel: self.userPostsVM)
            self.userPostsTableVM.delegate = self
            self.mainTableview.delegate = self.userPostsTableVM
            self.mainTableview.dataSource = self.userPostsTableVM
        }
        
        //Register custom cell
        self.mainTableview.register(UserPostCell.self, forCellReuseIdentifier: KUSERPOSTCELL)
    }
    
    @objc func didPressedBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UserPostsViewController:UserPostsTableViewModelDelegate {
    //Load data after fetch data
    func reloadPostsList() {
        self.mainTableview.reloadData()
    }
}

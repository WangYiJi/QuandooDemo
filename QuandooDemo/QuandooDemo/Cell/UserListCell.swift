//
//  UserListCell.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {
    
    var lblName:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblUserName:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblEmail:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblAddress:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Setup all views use autolayout
    func setUpUI () {
        self.addSubview(lblUserName)
        lblUserName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        lblUserName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblUserName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblUserName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        self.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: lblUserName.bottomAnchor, constant: 5).isActive = true
        lblName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        self.addSubview(lblEmail)
        lblEmail.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 5).isActive = true
        lblEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        self.addSubview(lblAddress)
        lblAddress.topAnchor.constraint(equalTo: lblEmail.bottomAnchor, constant: 5).isActive = true
        lblAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblAddress.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        lblAddress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lblAddress.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
    }
    
    func setUpWithUserInfo(userInfo:UserEntity) {
        lblName.text = userInfo.name
        lblUserName.text = userInfo.username
        lblEmail.text = userInfo.email
        
        lblAddress.text = userInfo.userFullAddress()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

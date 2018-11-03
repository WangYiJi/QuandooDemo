//
//  UserPostCell.swift
//  QuandooDemo
//
//  Created by wyj on 2018/11/3.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {
    
    var lblTitle:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblBody:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ////Setup all views use autolayout
    func setUpUI() {
        self.addSubview(lblTitle)
        
        lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        self.addSubview(lblBody)
        lblBody.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5).isActive = true
        lblBody.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblBody.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        lblBody.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lblBody.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpPostInfo(post:UserPost) {
        lblTitle.text = post.title
        lblBody.text = post.body
    }

}

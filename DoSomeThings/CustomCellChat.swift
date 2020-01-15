//
//  CustomCellChat.swift
//  DoSomeThings
//
//  Created by Thiện Tùng on 1/15/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class CustomCellChat: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .brown
        
        return view
    } ()
    let avt: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        
        return image
    } ()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    } ()
    
    let mesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        
        return label
    } ()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        setupLayout()
    }
    
    func setupLayout () {
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        //avt
        containerView.addSubview(avt)
        avt.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        avt.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        avt.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -8).isActive = true
        avt.widthAnchor.constraint(equalTo: avt.heightAnchor, multiplier: 1).isActive = true
        
        //nameLabel
        containerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: avt.topAnchor, constant: 6).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avt.rightAnchor, constant: 16).isActive = true
    
        
        //mes
        containerView.addSubview(mesLabel)
        mesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        mesLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        mesLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        
    }
}

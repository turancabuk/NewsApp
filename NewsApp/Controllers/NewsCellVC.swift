//
//  NewsCellVC.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import UIKit

class NewsCellVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsSource: UILabel!
    
    func configure(_ vm: MainViewModel) {
        
        func articleModel(model: Article?) {
            guard let article = model  else {return}
            titleLabel.text = model?.title
        }
    }
}

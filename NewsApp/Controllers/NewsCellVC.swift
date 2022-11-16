//
//  NewsCellVC.swift
//  NewsApp
//  Created by Turan Çabuk on 8.11.2022.

import UIKit
import Kingfisher

class NewsCellVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    
        func articleModel(model: Article?) {
            guard let model = model  else {return}
            titleLabel.text = model.title
            titleLabel.textColor = .darkText
            sourceLabel.text = model.author
            sourceLabel.textColor = .link
            
            let url = URL(string: model.urlToImage ?? "sondakika")
            newsImage.kf.setImage(with: url)
            
    }
}

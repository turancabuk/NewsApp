//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Turan Çabuk on 15.11.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var selectedNews: Article?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedNews?.title
        titleLabel.textColor = .darkText
        descriptionLabel.text = selectedNews?.content
      
        var url = URL(string: selectedNews?.urlToImage ?? "")
        newsImageView.kf.setImage(with: url)
        

       
    }
    

  

}

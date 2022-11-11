//
//  ViewController.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel = .init(webService: .init(webService: NewsWebService()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! NewsCellVC
        cell.titleLabel.text = "başlık buraya gelecek"
        cell.newsSource.text = "haber kaynağı"
        cell.newsImage.image = UIImage(named: "ekran")
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
}

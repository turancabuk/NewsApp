//
//  ViewController.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var viewModel: MainViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel = MainViewModel(webService: MainWebServiceAdapter(webService: NewsWebService()))
        
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

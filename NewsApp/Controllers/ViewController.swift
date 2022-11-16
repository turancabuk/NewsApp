//
//  ViewController.swift
//  NewsApp
//  Created by Turan Çabuk on 8.11.2022.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var viewModel: MainViewModel?
    var chosenNews: Article?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel = MainViewModel(webService: MainWebServiceAdapter(webService: NewsWebService()))
        
        guard let viewModel = viewModel else {return}
        viewModel.getNews{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

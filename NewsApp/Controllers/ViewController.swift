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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCellVC = (tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? NewsCellVC)!
        let article = viewModel?.articleList[indexPath.row]
        cell.articleModel(model: article)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articleList.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenNews = viewModel?.articleList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVc = segue.destination as! DetailViewController
            destinationVc.selectedNews = chosenNews
        }
    }
   
}

//
//  ViewController.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let api = RepositoryAPI()
    var repositories: [Repository] = []
    
    let userApi = UserAPI()
    var user1: User = User.init(login: "dsadasd", name: "user1")

    
    

    @IBOutlet weak var tableView: UITableView!

    var refreshControl = UIRefreshControl()

    var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.isHidden = true
        activityIndicator = UIActivityIndicatorView(style: .medium)

        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    
        tableView.dataSource = self


        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        tableView.refreshControl = refreshControl

        tableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "repositoryCell")

        loadData()

    }

    @objc func refresh(_ sender: AnyObject) {
        loadData()
    }

    func loadData() {
        api.fetchRepositories() { repos in
            DispatchQueue.main.async {
                self.repositories = repos
                self.tableView.reloadData()
                self.tableView.isHidden = false
                self.activityIndicator.stopAnimating()
                self.refreshControl.endRefreshing()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoryTableViewCell
        let repository = repositories[indexPath.row]
        
        userApi.fetchUser(login: repository.owner?.login) { userData in
            DispatchQueue.main.async {
               if userData.name != nil {
                    self.user1.name = userData.name
                } else {
                    self.user1.name = userData.login
                }
            }
        }

       
        cell.updateCell(item: repository)
        

        if let urlString = repository.owner?.avatarUrl,
            let url = URL(string: urlString) {
            cell.repositoryImageView.kf.setImage(
                with: url,
                placeholder: nil,
                options: []
            )
        }

        return cell
    }
}



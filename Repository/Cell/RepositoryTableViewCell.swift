//
//  RepositoryTableViewCell.swift
//  Repository
//
//  Created by Daniel Barreto on 29/08/20.
//  Copyright © 2020 Daniel Barreto. All rights reserved.
//

import UIKit

extension Double {
    var kmFormatted: String {

        if self >= 10000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(format: "%.0f", locale: Locale.current,self)
    }
}

class RepositoryTableViewCell: UITableViewCell {
    
    let userApi = UserAPI()
    
    var user : User? = nil
    
    func updateCell(item: Repository) {
        self.repositoryNameLabel.text = item.name
        
        if (self.user == nil) {
            userApi.fetchUser(login: item.owner?.login) { userData in
                DispatchQueue.main.async {
                    self.user = userData
                    if self.user?.name != nil {
                        self.repositoryFullNameLabel.text = self.user?.name
                    } else {
                        self.repositoryFullNameLabel.text = item.owner?.login
                    }
                }
            }
        }
        self.starsLabel.text =  "⭐️ \(item.starsCount!.kmFormatted)"
    }
    
    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var repositoryFullNameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

}

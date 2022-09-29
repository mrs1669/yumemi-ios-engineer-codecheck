//
//  RepositoryDetailViewController
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var repositoryFullnameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    @IBOutlet private weak var watchersCountLabel: UILabel!
    @IBOutlet private weak var forksCountLabel: UILabel!
    @IBOutlet private weak var openIssueCountLabel: UILabel!
    var repositorySearchTableViewController: SearchRepositoryTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let repositories = repositorySearchTableViewController.items[repositorySearchTableViewController.idx]
        guard let language = repositories.language else { return }
        languageLabel.text = "Written in \(language)"
        starsCountLabel.text = "\(repositories.stargazersCount) stars"
        watchersCountLabel.text = "\(repositories.watchersCount) watchers"
        forksCountLabel.text = "\(repositories.forksCount) forks"
        openIssueCountLabel.text = "\(repositories.openIssuesCount) open issues"
        getImage()
    }

    func getImage() {
        let repositories = repositorySearchTableViewController.items[repositorySearchTableViewController.idx]
        repositoryFullnameLabel.text = repositories.fullName
        guard let avatarUrl = URL(string: repositories.owner.avatarUrl) else { return }
        URLSession.shared.dataTask(with: avatarUrl) { [weak self] (data, _, _) in
            guard let data = data else { return }
            guard let avatarImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.avatarImageView.image = avatarImage
            }
        }.resume()
    }

}

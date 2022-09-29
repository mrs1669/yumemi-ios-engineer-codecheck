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
    var repositorySearchViewController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let items = repositorySearchViewController.items[repositorySearchViewController.idx]
        guard let language = items.language else { return }
        languageLabel.text = "Written in \(language)"
        starsCountLabel.text = "\(items.stargazersCount) stars"
        watchersCountLabel.text = "\(items.watchersCount) watchers"
        forksCountLabel.text = "\(items.forksCount) forks"
        openIssueCountLabel.text = "\(items.openIssuesCount) open issues"
        getImage()
    }

    func getImage() {
        let repo = repositorySearchViewController.items[repositorySearchViewController.idx]
        repositoryFullnameLabel.text = repo.fullName
        guard let avatarUrl = URL(string: repo.owner.avatarUrl) else { return }
        URLSession.shared.dataTask(with: avatarUrl) { [weak self] (data, _, _) in
            guard let data = data else { return }
            guard let avatarImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.avatarImageView.image = avatarImage
            }
        }.resume()
    }

}

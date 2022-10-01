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
    var item: Repository?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        getImage()
    }

    private func configureLabel() {
        guard let repository = item else { return }
        if let language = repository.language {
            languageLabel.text = "Written in \(language)"
        } else {
            languageLabel.text = "言語が含まれていません"
        }
        starsCountLabel.text = "\(repository.stargazersCount) stars"
        watchersCountLabel.text = "\(repository.watchersCount) watchers"
        forksCountLabel.text = "\(repository.forksCount) forks"
        openIssueCountLabel.text = "\(repository.openIssuesCount) open issues"
    }

    func getImage() {
        guard let repository = item else { return }
        repositoryFullnameLabel.adjustsFontSizeToFitWidth = true
        repositoryFullnameLabel.text = repository.fullName
        guard let avatarUrl = URL(string: repository.owner.avatarUrl) else { return }
        URLSession.shared.dataTask(with: avatarUrl) { [weak self] (data, _, _) in
            guard let data = data else { return }
            guard let avatarImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.avatarImageView.image = avatarImage
            }
        }.resume()
    }

}

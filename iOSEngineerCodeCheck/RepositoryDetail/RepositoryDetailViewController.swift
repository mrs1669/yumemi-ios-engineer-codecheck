//
//  RepositoryDetailViewController
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    @IBOutlet private weak var repositoryDetailCardView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var visitRepositoryButton: UIButton!
    @IBOutlet private weak var repositoryFullnameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    @IBOutlet private weak var watchersCountLabel: UILabel!
    @IBOutlet private weak var forksCountLabel: UILabel!
    @IBOutlet private weak var openIssueCountLabel: UILabel!
    var repository: Repository?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureRepositoryDetailCardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureButton()
        configureAvatarImage()
    }

    private func configureRepositoryDetailCardView() {
        repositoryDetailCardView.layer.cornerRadius = 30
        repositoryDetailCardView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        repositoryDetailCardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        repositoryDetailCardView.layer.shadowColor = UIColor.black.cgColor
        repositoryDetailCardView.layer.shadowOpacity = 0.3
        repositoryDetailCardView.layer.shadowRadius = 10
    }

    private func configureLabel() {
        guard let repository = repository else { return }
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

    private func configureButton() {
        visitRepositoryButton.setTitleColor(R.color.mainTheme(), for: .normal)
        visitRepositoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        visitRepositoryButton.addTarget(self, action: #selector(pushVisitRepositoryButton), for: .touchUpInside)
    }

    @objc func pushVisitRepositoryButton(sender: UIButton) {
        if let repositoryURL = repository?.repositoryURL {
            UIApplication.shared.open(repositoryURL)
        }
    }

    private func configureAvatarImage() {
        getImage()
        ≈.layer.cornerRadius = 30
        avatarImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    func getImage() {
        guard let repository = repository else { return }
        repositoryFullnameLabel.adjustsFontSizeToFitWidth = true
        repositoryFullnameLabel.text = repository.fullName
        let avatarUrl = repository.owner.avatarUrl
        URLSession.shared.dataTask(with: avatarUrl) { [weak self] (data, _, _) in
            guard let data = data else { return }
            guard let avatarImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.avatarImageView.image = avatarImage
            }
        }.resume()
    }

}

//
//  RepositoryDetailViewController
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Lottie
import UIKit

class RepositoryDetailViewController: UIViewController {

    @IBOutlet private weak var repositoryDetailCardView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var visitRepositoryButton: UIButton!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    @IBOutlet private weak var watchersCountLabel: UILabel!
    @IBOutlet private weak var forksCountLabel: UILabel!
    @IBOutlet private weak var openIssueCountLabel: UILabel!
    private var animationView = AnimationView()
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
        addAnimationView()
    }

    // MARK: - RepositoryDetailCardView
    private func configureRepositoryDetailCardView() {
        repositoryDetailCardView.layer.cornerRadius = 30
        repositoryDetailCardView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        repositoryDetailCardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        repositoryDetailCardView.layer.shadowColor = UIColor.black.cgColor
        repositoryDetailCardView.layer.shadowOpacity = 0.3
        repositoryDetailCardView.layer.shadowRadius = 10
    }

    // MARK: - UILabel
    private func configureLabel() {
        guard let repository = repository else { return }
        repositoryNameLabel.adjustsFontSizeToFitWidth = true
        repositoryNameLabel.text = repository.repositoryName
        ownerNameLabel.text = "by \(repository.owner.ownerName)"
        languageLabel.adjustsFontSizeToFitWidth = true
        if let language = repository.language {
            languageLabel.text = "Written in \(language)"
        } else {
            languageLabel.text = "language not included."
        }
        starsCountLabel.text = "\(repository.stargazersCount) stars"
        watchersCountLabel.text = "\(repository.watchersCount) watchers"
        forksCountLabel.text = "\(repository.forksCount) forks"
        openIssueCountLabel.text = "\(repository.openIssuesCount) open issues"
    }

    // MARK: - TransitionGitHubApp
    private func configureButton() {
        visitRepositoryButton.setTitle(R.string.localizable.visitThisRepository(), for: .normal)
        visitRepositoryButton.setTitleColor(R.color.mainTheme(), for: .normal)
        visitRepositoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        visitRepositoryButton.addTarget(self, action: #selector(pushVisitRepositoryButton), for: .touchUpInside)
        visitRepositoryButton.layer.masksToBounds = false
        visitRepositoryButton.layer.cornerRadius  = 20
        visitRepositoryButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        visitRepositoryButton.layer.shadowOpacity = 0.2
        visitRepositoryButton.layer.shadowRadius = 8
    }

    @objc func pushVisitRepositoryButton(sender: UIButton) {
        if let repositoryURL = repository?.repositoryURL {
            UIApplication.shared.open(repositoryURL)
        }
    }

    // MARK: - AnimationView
    private func addAnimationView() {
        animationView = AnimationView(name: "GitHubAnimation") //ここに先ほどダウンロードしたファイル名を記述（拡張子は必要なし）
        animationView.frame = CGRect(x: 30, y: view.frame.size.height - 150, width: 100, height: 100)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }

    // MARK: - AvatarImage
    private func configureAvatarImage() {
        getImage()
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    func getImage() {
        guard let repository = repository else { return }
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

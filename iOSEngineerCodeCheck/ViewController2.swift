//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet private weak var imgView: UIImageView!

    @IBOutlet private weak var ttlLbl: UILabel!

    @IBOutlet private weak var langLbl: UILabel!

    @IBOutlet private weak var strsLbl: UILabel!
    @IBOutlet private weak var wchsLbl: UILabel!
    @IBOutlet private weak var frksLbl: UILabel!
    @IBOutlet private weak var isssLbl: UILabel!

    var vc1: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        //let repo = vc1.repo[vc1.idx]
        let items = vc1.items[vc1.idx]
        guard let language = items.language else { return }
        langLbl.text = "Written in \(language)"
        strsLbl.text = "\(items.stargazersCount) stars"
        wchsLbl.text = "\(items.watchersCount) watchers"
        frksLbl.text = "\(items.forksCount) forks"
        isssLbl.text = "\(items.openIssuesCount) open issues"
        getImage()

    }

    func getImage() {

        let repo = vc1.items[vc1.idx]

        ttlLbl.text = repo.fullName
        guard let avatarUrl = URL(string: repo.owner.avatarUrl) else { return }
        URLSession.shared.dataTask(with: avatarUrl) { [weak self] (data, _, _) in
            guard let data = data else { return }
            guard let avatarImage = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self?.imgView.image = avatarImage
            }
        }.resume()
    }

}

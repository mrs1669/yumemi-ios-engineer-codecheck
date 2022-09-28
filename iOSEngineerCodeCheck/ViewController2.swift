//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var ttlLbl: UILabel!

    @IBOutlet weak var langLbl: UILabel!

    @IBOutlet weak var strsLbl: UILabel!
    @IBOutlet weak var wchsLbl: UILabel!
    @IBOutlet weak var frksLbl: UILabel!
    @IBOutlet weak var isssLbl: UILabel!

    var vc1: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let repo = vc1.repo[vc1.idx]

        langLbl.text = "Written in \(repo["language"] as? String ?? "")"
        strsLbl.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        wchsLbl.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        frksLbl.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        isssLbl.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        getImage()

    }

    func getImage() {

        let repo = vc1.repo[vc1.idx]

        ttlLbl.text = repo["full_name"] as? String

        if let owner = repo["owner"] as? [String: Any] {
            if let imgURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, _, _) in
                    let img = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.imgView.image = img
                    }
                }.resume()
            }
        }

    }

}

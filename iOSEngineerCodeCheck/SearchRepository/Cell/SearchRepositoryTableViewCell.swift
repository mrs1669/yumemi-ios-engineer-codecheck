//
//  SearchRepositoryTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/10/02.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchRepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var floatingView: UIView!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    static let reuseIdentifier = "SearchRepositoryTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        configureFloatingView()
    }

    private func configureFloatingView() {
        floatingView.backgroundColor = .white
        floatingView.layer.masksToBounds = false
        floatingView.layer.cornerRadius  = 20
        floatingView.layer.shadowOffset = CGSize(width: 0, height: 5)
        floatingView.layer.shadowOpacity = 0.2
        floatingView.layer.shadowRadius = 8
        floatingView.layer.shouldRasterize = true
        floatingView.layer.rasterizationScale = UIScreen.main.scale
    }

    func configureCell(repository: Repository) {
        ownerNameLabel.text = repository.owner.ownerName
        repositoryNameLabel.text = repository.repositoryName
        languageLabel.text = repository.language
    }

}

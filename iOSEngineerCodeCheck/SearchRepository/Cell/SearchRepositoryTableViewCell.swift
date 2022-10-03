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
    @IBOutlet private weak var languageLabel: UILabel!
    static let reuseIdentifier = "SearchRepositoryTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        languageLabel.text = ""
        configureFloatingView()
    }

    private func configureFloatingView() {
        floatingView.backgroundColor = R.color.mainTheme()
    }

}

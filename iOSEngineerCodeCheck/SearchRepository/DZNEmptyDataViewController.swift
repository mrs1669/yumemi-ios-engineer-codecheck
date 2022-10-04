//
//  DZNEmptyDataViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/10/04.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import DZNEmptyDataSet

// View displayed when TableViewCell is empty
extension SearchRepositoryTableViewController: DZNEmptyDataSetSource {

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(systemName: "questionmark.folder")?
            .withTintColor(R.color.mainTheme() ?? .white)
            .resize(size: CGSize(width: 150, height: 150))
    }

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 27), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        return NSAttributedString(string: R.string.localizable.repositoryNotFound(), attributes: attributes)
    }

    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        return NSAttributedString(string: R.string.localizable.pleaseEnterTheNameOfTheRepositoryYouWishToSearch(), attributes: attributes)
    }

    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return R.color.background()
    }

}

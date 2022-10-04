//
//  DZNEmptyDataViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/10/04.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import DZNEmptyDataSet

extension SearchRepositoryTableViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 27), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        return NSAttributedString(string: "No items found", attributes: attributes)
    }

}

//
//  DZNEmptyDataViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/10/04.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import DZNEmptyDataSet

extension SearchRepositoryTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return R.color.background()
    }
}

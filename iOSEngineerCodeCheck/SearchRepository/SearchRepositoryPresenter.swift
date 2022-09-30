//
//  SearchRepositoryPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/09/30.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchRepositoryPresenterOutputProtocol: AnyObject {
    func updateRepositories(_ repositories: [Item])
}

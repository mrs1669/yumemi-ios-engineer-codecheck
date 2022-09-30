//
//  SearchRepositoryPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/09/30.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchRepositoryPresenterInputProtocol {
    var repositories: [Item] { get }
    func repository(forRow row: Int) -> Item?
    func viewDidLoad(keyword: String)
}

protocol SearchRepositoryPresenterOutputProtocol: AnyObject {
    func updateRepositories(_ repositories: [Item])
}

final class SearchRepositoryPresenter: SearchRepositoryPresenterInputProtocol {
    private(set) var repositories: [Item] = []
    private weak var view: SearchRepositoryPresenterOutputProtocol!
    private var model: SearchRepositoryModelProtocol

    init(view: SearchRepositoryPresenterOutputProtocol, model: SearchRepositoryModelProtocol) {
        self.view = view
        self.model = model
    }

    func repository(forRow row: Int) -> Item? {
        guard row < repositories.count else { return nil }
        return repositories[row]
    }

    func viewDidLoad(keyword: String) {
        if !keyword.isEmpty {
            model.fetchRepositories(keyword: keyword) { [weak self] result in
                switch result {
                case .success(let repositories):
                    self?.repositories = repositories
                    DispatchQueue.main.async {
                        self?.view.updateRepositories(repositories)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

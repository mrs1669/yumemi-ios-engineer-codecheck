//
//  SearchRepositoryPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/09/30.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchRepositoryPresenterInputProtocol {
    var repositories: [Repository] { get }
    func repository(forRow row: Int) -> Repository?
    func didSelectRow(at indexPath: IndexPath)
    func didTapSearchBar(keyword: String)
    func taskCancel()
}

protocol SearchRepositoryPresenterOutputProtocol: AnyObject {
    func updateRepositories(_ repositories: [Repository])
    func segueToRepositoryDetailView(index: Int)
}

final class SearchRepositoryPresenter: SearchRepositoryPresenterInputProtocol {

    private(set) var repositories: [Repository] = []
    var view: SearchRepositoryPresenterOutputProtocol!
    var model: SearchRepositoryModelProtocol

    init(view: SearchRepositoryPresenterOutputProtocol, model: SearchRepositoryModelProtocol) {
        self.view = view
        self.model = model
    }

    var numberOfRepositoris: Int {
        return repositories.count
    }

    func repository(forRow row: Int) -> Repository? {
        guard row < repositories.count else { return nil }
        return repositories[row]
    }

    func didTapSearchBar(keyword: String) {
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

    func didSelectRow(at indexPath: IndexPath) {
        view.segueToRepositoryDetailView(index: indexPath.row)
    }

    func taskCancel() {
        model.taskCancel()
    }
}

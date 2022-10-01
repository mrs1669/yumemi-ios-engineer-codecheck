//
//  SearchRepositoryTableViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchRepositoryTableViewController: UITableViewController {

    @IBOutlet private weak var repositorySearchBar: UISearchBar!
    var keyword: String!
    var index: Int!

    private var presenter: SearchRepositoryPresenterInputProtocol!
    func inject(presenter: SearchRepositoryPresenterInputProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchRepositoryPresenter(view: self, model: SearchRepositoryModel())
        configureTableView()
        configureSearchBar()
        inject(presenter: presenter)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            guard let repositoryDetailViewController = segue.destination as? RepositoryDetailViewController else { return }
            repositoryDetailViewController.item = presenter.repositories[index]
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let repository = presenter.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName
        cell.detailTextLabel?.text = repository.language
        return cell
    }

    // MARK: Called at segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        presenter.didSelectRow(at: indexPath)
    }

    private func configureTableView () {
        tableView.keyboardDismissMode = .onDrag
    }
}

extension SearchRepositoryTableViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        presenter.didTapSearchBar(keyword: keyword)
        searchBar.resignFirstResponder()
    }

    // MARK: Called at change SearchBar text
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.taskCancel()
    }

    private func configureSearchBar() {
        repositorySearchBar.text = "GitHubのリポジトリを検索できるよー"
        repositorySearchBar.delegate = self
    }
}

extension SearchRepositoryTableViewController: SearchRepositoryPresenterOutputProtocol {
    func updateRepositories(_ repositories: [Repository]) {
        tableView.reloadData()
    }

    func segueToRepositoryDetailView(index: Int) {
        performSegue(withIdentifier: "Detail", sender: self)
    }
}

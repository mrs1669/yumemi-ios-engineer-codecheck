//
//  SearchRepositoryTableViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import LicenseList
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
        configureNavigationItem()
        inject(presenter: presenter)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.searchRepositoryTableViewController.detail.identifier {
            guard let repositoryDetailViewController = segue.destination as? RepositoryDetailViewController else { return }
            repositoryDetailViewController.repository = presenter.repositories[index]
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchRepositoryTableViewCell.reuseIdentifier) as? SearchRepositoryTableViewCell else { return UITableViewCell() }
        if let repository = presenter.repository(forRow: indexPath.row) {
            cell.configureCell(repository: repository)
        }
        return cell
    }

    // MARK: Called at segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        presenter.didSelectRow(at: indexPath)
    }

    private func configureTableView () {
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib(resource: R.nib.searchRepositoryTableViewCell), forCellReuseIdentifier: SearchRepositoryTableViewCell.reuseIdentifier)
        tableView.rowHeight = 100
    }

    private func configureNavigationItem () {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(licenceVavigationBarButtonPressed(_:)))
    }

    @objc private func licenceVavigationBarButtonPressed(_ sender: UIBarButtonItem) {
        guard let licenceFileURL = Bundle.main.url(forResource: "license-list", withExtension: "plist") else { return }
        let licenceViewController = LicenseListViewController(fileURL: licenceFileURL)
        licenceViewController.title = "LICENSE"
        self.navigationController?.pushViewController(licenceViewController, animated: true)
    }
}

extension SearchRepositoryTableViewController: UISearchBarDelegate {

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
        repositorySearchBar.placeholder = "GitHubのリポジトリを検索できるよー"
        repositorySearchBar.delegate = self
    }
}

extension SearchRepositoryTableViewController: SearchRepositoryPresenterOutputProtocol {
    func updateRepositories(_ repositories: [Repository]) {
        tableView.reloadData()
    }

    func segueToRepositoryDetailView(index: Int) {
        performSegue(withIdentifier: R.segue.searchRepositoryTableViewController.detail, sender: self)
    }
}

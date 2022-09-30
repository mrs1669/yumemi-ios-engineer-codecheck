//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchRepositoryTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet private weak var schBr: UISearchBar!
    var items: [Item] = []
    var task: URLSessionTask?
    var keyword: String!
    var idx: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        schBr.text = "GitHubのリポジトリを検索できるよー"
        schBr.delegate = self
    }

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        keyword = searchBar.text!
        if !keyword.isEmpty {
            let encodeKeywordString = keyword.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
            let searchUrlString = "https://api.github.com/search/repositories?q=\(encodeKeywordString!)"
            task = URLSession.shared.dataTask(with: URL(string: searchUrlString)!) { [weak self] (data, _, _) in
                guard let data = data else { return }
                do {
                    let repositories = try JSONDecoder().decode(SearchRepository.self, from: data)
                    self?.items = repositories.items
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }
            // これ呼ばなきゃリストが更新されません
            task?.resume()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            guard let dtl = segue.destination as? RepositoryDetailViewController else { return }
            dtl.repositorySearchTableViewController = self
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let repository = items[indexPath.row]
        cell.textLabel?.text = repository.fullName
        cell.detailTextLabel?.text = repository.language
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        idx = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
    }

}
//
//  SearchRepositoryModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/09/30.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchRepositoryModelProtocol {
    func fetchRepositories(keyword: String, completion: @escaping (Result<[Item], Error>) -> Void)
    func connectCancel()
}

final class SearchRepositoryModel: SearchRepositoryModelProtocol {
    private var requestUrlString: String!
    private var task: URLSessionTask?

    // MARK: Fetch Repository
    func fetchRepositories(keyword: String, completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let encodeKeywordString = keyword.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return }
        requestUrlString = "https://api.github.com/search/repositories?q=\(encodeKeywordString)"
        task = URLSession.shared.dataTask(with: URL(string: requestUrlString)!) { [weak self] (data, _, _) in
            guard self != nil else { return }
            guard let data = data else { return }
            do {
                let repositories = try JSONDecoder().decode(SearchRepository.self, from: data)
                completion(.success(repositories.items))
            } catch let error {
                completion(.failure(error))
            }
        }
        task?.resume()
    }

    func connectCancel() {
        task?.cancel()
    }
}

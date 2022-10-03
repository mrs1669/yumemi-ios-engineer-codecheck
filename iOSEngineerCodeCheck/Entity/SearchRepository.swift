//
//  SearchRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 村石拓海 on 2022/09/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct SearchRepository: Codable {
    let items: [Repository]
}

struct Repository: Codable {
    let repositoryId: Int
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let owner: Owner

    private enum CodingKeys: String, CodingKey {
        case repositoryId = "id"
        case fullName = "full_name"
        case language = "language"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case owner = "owner"
    }
}

struct Owner: Codable {
    let ownerName: String
    let avatarUrl: String

    private enum CodingKeys: String, CodingKey {
        case ownerName = "login"
        case avatarUrl = "avatar_url"
    }
}

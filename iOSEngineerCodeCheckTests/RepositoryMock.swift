//
//  RepositoryMock.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 村石拓海 on 2022/10/04.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
@testable import iOSEngineerCodeCheck

extension Repository {
    static func mock() -> Repository {
        let repository = Repository(repositoryId: 44_838_949,
                                    repositoryName: "swift",
                                    fullName: "apple/swift",
                                    language: "C++",
                                    stargazersCount: 56_424,
                                    watchersCount: 56_424,
                                    forksCount: 9_055,
                                    openIssuesCount: 381,
                                    owner: .init(ownerName: "apple",
                                                 avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")!))
        return repository
    }
}

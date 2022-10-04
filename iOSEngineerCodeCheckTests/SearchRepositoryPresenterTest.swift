//
//  SearchRepositoryPresenterTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 村石拓海 on 2022/10/04.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

@testable import iOSEngineerCodeCheck
import XCTest

class SearchRepositoryPresenterOutputSpy: SearchRepositoryPresenterOutputProtocol {

    private(set) var countOfInvokingUpdateRepositories: Int = 0
    private(set) var countOfInvokingSegueToRepositoryDetail: Int = 0

    var updateUsersCalledWithUsers: (([Repository]) -> Void)?

    func updateRepositories(_ repositories: [Repository]) {
        countOfInvokingUpdateRepositories += 1
        updateUsersCalledWithUsers?(repositories)
    }

    func segueToRepositoryDetailView(index: Int) {
        countOfInvokingSegueToRepositoryDetail += 1
    }

}

class SearchRepositoryModelInputStub: SearchRepositoryModelProtocol {

    var repositories: [Repository] = []
    private var error: Error?

    func fetchRepositories(keyword: String, completion: @escaping (Result<[iOSEngineerCodeCheck.Repository], Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            repositories = [.init(repositoryId: 44_838_949,
                                  repositoryName: "swift",
                                  fullName: "apple/swift",
                                  language: "C++",
                                  repositoryURL: URL(string: "https://github.com/apple/swift")!,
                                  stargazersCount: 56_424,
                                  watchersCount: 56_424,
                                  forksCount: 9_055,
                                  openIssuesCount: 381,
                                  owner: .init(ownerName: "apple",
                                               avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")!))]
            completion(.success(repositories))
        }
    }

    func taskCancel() {
    }

    func addRepositories(result: Result<[Repository], Error>) {
        switch result {
        case let .success(repositories):
            self.repositories = repositories

        case let .failure(error):
            self.error = error
        }
    }

}

final class SearchRepositoryPresenterTest: XCTestCase {

    private var repositories: [Repository] = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDidTapSearchButton() {
        XCTContext.runActivity(named: "検索ボタンタップ時処理") { _ in
            XCTContext.runActivity(named: "ユーザー検索成功時にView更新処理が呼ばれること") { _ in
                let spy = SearchRepositoryPresenterOutputSpy()
                let stub = SearchRepositoryModelInputStub()
                let presenter = SearchRepositoryPresenter(view: spy, model: stub)
                let repositories = [Repository.mock()]
                stub.addRepositories(result: .success(repositories))

                let expectation = XCTestExpectation(description: "didTapSearchButton内部で呼ばれるupdateUsersの実行を待つ")
                spy.updateUsersCalledWithUsers = { _ in
                    expectation.fulfill()
                }

                presenter.didTapSearchBar(keyword: "swift")
                wait(for: [expectation], timeout: 1.0)

                XCTAssertTrue(spy.countOfInvokingUpdateRepositories == 1)
                XCTAssertTrue(spy.countOfInvokingSegueToRepositoryDetail == 0)
                XCTAssertTrue(presenter.repositories.count == 1)
            }
            XCTContext.runActivity(named: "ユーザー検索失敗時はView更新処理が呼ばれないこと") { _ in
                let spy = SearchRepositoryPresenterOutputSpy()
                let stub = SearchRepositoryModelInputStub()
                let presenter = SearchRepositoryPresenter(view: spy, model: stub)
                let error = NSError()
                presenter.view = spy
                presenter.model = stub
                stub.addRepositories(result: .failure(error))
                presenter.didTapSearchBar(keyword: "")

                XCTAssertTrue(presenter.numberOfRepositoris == 0)
                XCTAssertTrue(spy.countOfInvokingUpdateRepositories == 0)
            }
        }
    }

    func testSearchRepositoriesError() {
        let spy = SearchRepositoryPresenterOutputSpy()
        let stub = SearchRepositoryModelInputStub()
        let presenter = SearchRepositoryPresenter(view: spy, model: stub)
        let error = NSError()
        presenter.view = spy
        presenter.model = stub
        stub.addRepositories(result: .failure(error))
        presenter.didTapSearchBar(keyword: "")

        XCTAssertTrue(spy.countOfInvokingUpdateRepositories == 0)
        XCTAssertTrue(spy.countOfInvokingSegueToRepositoryDetail == 0)
    }

}

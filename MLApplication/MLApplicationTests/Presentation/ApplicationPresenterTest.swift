//
//  ApplicationPresenterTest.swift
//  MLApplicationTests
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import XCTest

@testable import MLApplication

final class ApplicationPresenterTest: XCTestCase {
    private var sut: ApplicationPresenterType!
    private var coordinator: ApplicationCoordinatorSpy!

    override func setUp() {
        super.setUp()

        coordinator = ApplicationCoordinatorSpy()
        sut = ApplicationPresenter(
            dependencies: ApplicationPresenter.Dependencies(coordinator: coordinator))
    }

    override func tearDown() {
        coordinator = nil
        sut = nil
        super.tearDown()
    }

    func testViewDidLoad_WhenIsCalled_ThenRunProductListModule() {
        let expectation = XCTestExpectation(description: "Wait to run product list module")
        var isRunProductListModuleCalled = false

        coordinator.runProductListModuleCallBack = {
            isRunProductListModuleCalled = true
            expectation.fulfill()
        }

        sut.viewDidLoad()

        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(isRunProductListModuleCalled, "Run product list module.")
    }
}

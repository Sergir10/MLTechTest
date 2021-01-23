//
//  RESTClientTest.swift
//  MLTechNetworkTests
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import XCTest

@testable import MLTechNetwork

final class RESTClientTest: XCTestCase {
    private struct Constant {
        static let validBaseURL = "https://api.mercadolibre.com/sites/MLA/"
        static let invalidBaseURL = "@#$%^&*"
    }

    private var cancellable = Set<AnyCancellable>()
    private var sut: RESTClientType!

    override func setUp() {
        super.setUp()
        sut = RESTClient(baseURL: Constant.validBaseURL)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInit_GivenBaseURL_ThenSeTBaseURL() {
        XCTAssertEqual(sut.baseURL, Constant.validBaseURL)
    }

    func testRequest_GivenInvalidBaseURL_ThenReturnInvalidPathError() {
        let endpoint = RESTEndpoint<String>(method: .get, relativePath: "search", params: [:])
        let expectation = XCTestExpectation(description: "Waiting for request response.")

        sut = RESTClient(baseURL: Constant.invalidBaseURL)

        sut.requestTo(endpoint: endpoint).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail()
                case .failure(let error):
                    switch error {
                    case .invalidPath(message: let message):
                        XCTAssertTrue(true, "Error: \(message)")
                    default:
                        XCTFail()
                    }
                }

                expectation.fulfill()
            },
            receiveValue: { _ in }).store(in: &cancellable)

        wait(for: [expectation], timeout: 1.0)
    }

    func testRequest_GivenInvalidParams_WhenIsURLEncodedContentType_ThenReturnInvalidParamsError() {
        let invalidParams: [String: Any] = ["Param1": 12, "Param2": true]
        let endpoint = RESTEndpoint<String>(method: .get, relativePath: "search", params: invalidParams, contentType: .URLEncoded)
        let expectation = XCTestExpectation(description: "Waiting for request response.")

        sut.requestTo(endpoint: endpoint).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail()
                case .failure(let error):
                    switch error {
                    case .invalidParams(message: let message):
                        XCTAssertTrue(true, "Error: \(message)")
                    default:
                        XCTFail()
                    }
                }

                expectation.fulfill()
            },
            receiveValue: { _ in }).store(in: &cancellable)

        wait(for: [expectation], timeout: 1.0)
    }

    func testRequest_GivenResponse_WhenCanNotDecode_ThenReturnDecodeError() {
        let endpoint = RESTEndpoint<String>(method: .get, relativePath: "search", params: [:])
        let expectation = XCTestExpectation(description: "Waiting for request response.")

        sut.requestTo(endpoint: endpoint).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail()
                case .failure(let error):
                    switch error {
                    case .decodeError(error: let message):
                        XCTAssertTrue(true, "Error: \(message)")
                    default:
                        XCTFail()
                    }
                }

                expectation.fulfill()
            },
            receiveValue: { _ in }).store(in: &cancellable)

        wait(for: [expectation], timeout: 1.0)
    }
}

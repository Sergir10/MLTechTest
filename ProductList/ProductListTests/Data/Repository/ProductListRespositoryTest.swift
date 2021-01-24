//
//  ProductListRespositoryTest.swift
//  ProductListTests
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechCore
import XCTest

@testable import MLTechNetwork
@testable import ProductList

final class ProductListRespositoryTest: XCTestCase {
    private var sut: ProductListRespositoryType!
    private var clientSpy: RESTClientSpy!
    private var client: RESTClientStub!
    private var cancelable = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()

        client = RESTClientStub(baseURL: "baseURL")
        clientSpy = RESTClientSpy()
        sut = ProductListRespository(client: client)
    }

    override func tearDown() {
        client = nil
        sut = nil
        super.tearDown()
    }

    func testSearchProduct_GivenQuery_WhenRequestIsSuccess_ThenReturnDecodeEntityInPublisher() {
        let completionExpectation = XCTestExpectation(description: "Wait for completion client response.")
        let valueExpectation = XCTestExpectation(description: "Wait for value client response.")

        /// Setup `Stub client` response.
        client.response = APIProductList(
            sort: APICoreSort(identifier: "", name: ""),
            paging: APICorePaginate(total: 0, primaryResults: 0, offset: 0, limit: 0),
            results: [
                APIProductListResult(
                    identifier: "",
                    title: "",
                    price: 0,
                    availableQuantity: 0,
                    thumbnail: "",
                    shipping: APIShipping(freeShipping: true)),
            ])

        sut.searchProduct(by: "").sink(
            receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTFail("\(error)")

                case .finished:
                    completionExpectation.fulfill()
                    XCTAssertTrue(true)
                }
            },
            receiveValue: { (_: APIProductList) in
                XCTAssertTrue(true)
                valueExpectation.fulfill()
            }).store(in: &cancelable)

        /// Sending the finish signal to publisher after publisher get subcribe throught `sink` to allow made the respective validations.
        client.finishRequest?()

        wait(for: [completionExpectation], timeout: 1.0)
        wait(for: [valueExpectation], timeout: 1.0)
    }

    func testSearchProduct_GivenQuery_WhenRequestFail_ThenReturnFailPublisher() {
        let completionExpectation = XCTestExpectation(description: "Wait for completion client response.")

        /// Setup `Stub client` response.
        client.responseError = ServiceError.serverError(response: "Error.")

        sut.searchProduct(by: "").sink(
            receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTAssertTrue(true, "\(error)")
                    completionExpectation.fulfill()
                case .finished:
                    XCTFail()
                }
            },
            receiveValue: { (_: APIProductList) in
                XCTFail()
            }).store(in: &cancelable)

        wait(for: [completionExpectation], timeout: 1.0)
    }

    func testSearchProduct_GivenQuery_ThenValidateModelType() {
        let expectation = XCTestExpectation(description: "Wait for client called.")
        var sendedType: Codable.Type!

        clientSpy.requestToCallBack = { _, type in
            sendedType = type
            expectation.fulfill()
        }

        sut = ProductListRespository(client: clientSpy)
        sut.searchProduct(by: "").sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in }).store(in: &cancelable)

        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(sendedType is APIProductList.Type)
    }

    func testSearchProduct_GivenQuery_ThenHTTPMethodIsGet() {
        let expectation = XCTestExpectation(description: "Wait for client called.")
        var sendedEndpoint: RESTEndpointType!

        clientSpy.requestToCallBack = { endpoint, _ in
            sendedEndpoint = endpoint
            expectation.fulfill()
        }

        sut = ProductListRespository(client: clientSpy)
        sut.searchProduct(by: "").sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in }).store(in: &cancelable)

        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sendedEndpoint.method, .get)
    }

    func testSearchProduct_GivenQuery_ThenValidateRelativePath() {
        let expectation = XCTestExpectation(description: "Wait for client called.")
        var sendedEndpoint: RESTEndpointType!

        clientSpy.requestToCallBack = { endpoint, _ in
            sendedEndpoint = endpoint
            expectation.fulfill()
        }

        sut = ProductListRespository(client: clientSpy)
        sut.searchProduct(by: "").sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in }).store(in: &cancelable)

        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sendedEndpoint.relativePath, "/sites/MCO/search")
    }

    func testSearchProduct_GivenQuery_ThenContentTypeIsJson() {
        let expectation = XCTestExpectation(description: "Wait for client called.")
        var sendedEndpoint: RESTEndpointType!

        clientSpy.requestToCallBack = { endpoint, _ in
            sendedEndpoint = endpoint
            expectation.fulfill()
        }

        sut = ProductListRespository(client: clientSpy)
        sut.searchProduct(by: "").sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in }).store(in: &cancelable)

        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sendedEndpoint.contentType, .URLEncoded)
    }
}

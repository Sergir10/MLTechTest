//
//  RESTClient.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import Foundation

public final class RESTClient {
    private struct Constant {
        static let httpHeader = "Content-Type"
    }

    public let baseURL: String

    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    private func getURLRequest<Response>(from endpoint: RESTEndpoint<Response>) throws -> URLRequest {
        /// We could make force cast due to  `getURLComponents` is returning a valid `URLComponent` with a non nil `URL` or throwing an error.
        var request = URLRequest(url: try getURLComponents(from: endpoint).url!)

        request.httpMethod = endpoint.method.rawValue
        request.setValue(endpoint.contentType.rawValue, forHTTPHeaderField: Constant.httpHeader)
        request.httpBody = try getHttpBody(from: endpoint)

        return request
    }

    private func getURLComponents<Response>(from endpoint: RESTEndpoint<Response>) throws -> URLComponents {
        guard var URLComponents = URLComponents(string: baseURL) else {
            throw ServiceError.invalidPath(message: "Invalid baseURL: \(baseURL)")
        }

        guard endpoint.contentType == .URLEncoded else {
            return URLComponents
        }

        guard let params = endpoint.params as? [String: String] else {
            throw ServiceError.invalidParams(message: "Invalid format params for URL encoded content type. Params: \(endpoint.params ?? [:])")
        }

        URLComponents.queryItems = params.map { URLQueryItem(name: $0.0, value: $0.1) }
        return URLComponents
    }

    private func getHttpBody<Response>(from endpoint: RESTEndpoint<Response>) throws -> Data? {
        guard endpoint.contentType == .json, endpoint.method == .post, let params = endpoint.params else {
            return nil
        }

        return try JSONSerialization.data(withJSONObject: params, options: [])
    }

    private func handleResponse(_ response: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let resp = response.response as? HTTPURLResponse, resp.statusCode == 200 else {
            throw ServiceError.serverError(response: response.response)
        }

        return response.data
    }
}

extension RESTClient: RESTClientType {
    public func requestTo<Response: Codable>(endpoint: RESTEndpoint<Response>) -> AnyPublisher<Response, ServiceError> {
        do {
            return URLSession.shared.dataTaskPublisher(for: try getURLRequest(from: endpoint))
                .retry(2)
                .tryMap { try self.handleResponse($0) }
                .decode(type: Response.self, decoder: JSONDecoder())
                .mapError { ServiceError.decodeError(error: $0) }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error as! ServiceError).eraseToAnyPublisher()
        }
    }
}

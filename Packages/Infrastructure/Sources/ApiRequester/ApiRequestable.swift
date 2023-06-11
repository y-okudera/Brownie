//
//  ApiRequestable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

// MARK: - ApiRequestable
public protocol ApiRequestable {

    associatedtype Response: Decodable, Equatable, Sendable

    var baseUrl: String { get }
    var path: String { get }
    var method: String { get }
    var timeoutInterval: TimeInterval { get }
    var headerFields: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var bodyItems: [String: Any]? { get }
    var urlRequest: URLRequest? { get }
}

extension ApiRequestable {

    public var baseUrl: String {
        "https://qiita.com"
    }

    public var timeoutInterval: TimeInterval {
        30.0
    }

    public var headerFields: [String: String] {
        [
            "Authorization": "",
        ]
    }

    public var queryItems: [URLQueryItem]? {
        nil
    }

    public var bodyItems: [String: Any]? {
        nil
    }

    public var urlRequest: URLRequest? {
        let url: URL? = {
            var urlComponents = URLComponents(string: baseUrl + path)
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }()
        print("URL", url ?? "")

        guard let url = url else {
            return nil
        }
        let urlRequest: URLRequest = {
            var request = URLRequest(url: url)
            request.httpMethod = method
            request.timeoutInterval = timeoutInterval
            headerFields.forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }
            if let bodyItems,
               let httpBody = try? JSONSerialization.data(withJSONObject: bodyItems, options: [])
            {
                request.httpBody = httpBody
            }
            return request
        }()

        return urlRequest
    }
}

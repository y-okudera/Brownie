//
//  ApiResponseDecoder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

public enum ApiResponseDecoder {

    public static func decode<T: ApiRequestable>(
        data: (Data, URLResponse),
        as type: T
    ) throws -> T.Response {
        guard let httpURLResponse = data.1 as? HTTPURLResponse else {
            throw ApiError.invalidResponse(URLError(.badServerResponse))
        }
        print("url: \(String(describing: httpURLResponse.url)) statusCode: \(httpURLResponse.statusCode)")

        switch httpURLResponse.statusCode {
        case 200 ... 299:
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseObject = try jsonDecoder.decode(T.Response.self, from: data.0)
                return responseObject
            } catch let decodingError as DecodingError {
                throw ApiError.decodeError(decodingError)
            }
        case 400 ... 499:
            throw ApiError.clientError(httpURLResponse.statusCode)
        case 500 ... 599:
            throw ApiError.serverError(httpURLResponse.statusCode)
        default:
            throw ApiError.invalidResponse(URLError(.badServerResponse))
        }
    }
}

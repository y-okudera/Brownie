//
//  ApiRequester.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

public enum ApiRequester {

    public static func request<T: ApiRequestable>(_ apiRequest: T) async throws -> T.Response {
        guard let urlRequest = apiRequest.urlRequest else {
            throw ApiError.invalidRequest
        }
        let data = try await URLSession.shared.data(for: urlRequest)
        let response = try ApiResponseDecoder.decode(data: data, as: apiRequest)
        return response
    }
}

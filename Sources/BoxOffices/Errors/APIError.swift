//
//  File.swift
//  BoxOffices
//
//  Created by juseongKim on 9/16/25.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case decodingError
    case responseIsExpected
    case invalidRequest(_ statucCode: Int)
    case serverNotResponding(_ statucCode: Int)
    case responseIsFail(_ statucCode: Int)
}

extension APIError {
    init?(httpResponse: HTTPURLResponse?) {
        guard let httpResponse else {
            self = APIError.responseIsExpected
            return
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return nil
        case 400..<500:
            self = APIError.invalidRequest(httpResponse.statusCode)
        case 500..<600:
            self = APIError.serverNotResponding(httpResponse.statusCode)
        default:
            self = APIError.responseIsFail(httpResponse.statusCode)
        }
    }
}

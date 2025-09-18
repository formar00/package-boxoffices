//
//  File.swift
//  BoxOffices
//
//  Created by juseongKim on 9/16/25.
//

import Foundation

class APIClient {
    
    private let baseUrl: String = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response: Decodable>(
        path: String, // /boxoffice/searchDailyBoxOfficeList.json
        httpMethod: HTTPMethod,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Response {
        let urlRequest = try URLRequest(
            urlString: baseUrl + path,
            httpMethod: httpMethod,
            key: key,
            queryItems: queryItems
        )
        
        // URLSession Data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        // HTTP URL Response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse) {
            throw error
        }
                
        // Decoding
        let output = try JSONDecoder().decode(Response.self, from: data)
        return output
    }
    
}

//
//  File.swift
//  BoxOffices
//
//  Created by juseongKim on 9/16/25.
//

import Foundation

enum HTTPMethod: String {
    case get, post, delete, put
    
    var capitalizedValue: String {
        self.rawValue.capitalized // .get -> "GET"
    }
}

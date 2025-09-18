//
//  File.swift
//  BoxOffices
//
//  Created by juseongKim on 9/16/25.
//

import Foundation

extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}

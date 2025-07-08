//
//  DateFormatter.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import Foundation

extension Date {
    func formatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm:ss"
        return dateFormatter.string(from: self)
    }
}

//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Mackley Magalhães da Silva on 20/12/23.
//

import Foundation
import SwiftUI

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    func dateParse() -> Date {
        guard let parseDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return parseDate
    }
}
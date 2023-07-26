//
//  Date+Utils.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import Foundation

extension Date {
    static var appDateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
           formatter.timeZone = TimeZone(secondsFromGMT: 0)
           return formatter
       }
   
    var dayMonthYearString: String {
        let dateFormatter = Date.appDateFormatter
        dateFormatter.dateFormat = "dd, MM, yyyy"
        return dateFormatter.string(from: self)
    }
}

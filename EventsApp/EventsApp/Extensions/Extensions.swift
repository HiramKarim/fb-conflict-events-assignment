//
//  Extensions.swift
//  EventsApp
//
//  Created by Hiram Castro on 22/08/21.
//

import Foundation

extension String {
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MMMM d, yyyy h:mm a"
        let date: Date? = dateFormatter.date(from: self)
        return date
    }
    
}

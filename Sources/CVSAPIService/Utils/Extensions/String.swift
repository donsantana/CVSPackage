//
//  File.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/24/24.
//

import Foundation

extension String {
    
    func convertToDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            let formatedStringDate = dateFormatter.string(from: dt)
            return formatedStringDate
        }
        
        return "01-01-70"
    }
}

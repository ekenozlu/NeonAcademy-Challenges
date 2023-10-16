//
//  DateExtension.swift
//  Picker
//
//  Created by Eken Özlü on 6.10.2023.
//

import Foundation

extension Date {
    func ageAsString(from date: Date = Date()) -> String {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year, .month, .day], from: self, to: date)
        
        if let years = ageComponents.year, let months = ageComponents.month {
            if years == 0 {
                if months == 1 {
                    return "\(months) month old"
                } else {
                    return "\(months) months old"
                }
            } else {
                if months == 0 {
                    if years == 1 {
                        return "\(years) year old"
                    } else {
                        return "\(years) years old"
                    }
                } else {
                    return "\(years) years and \(months) months old"
                }
            }
        }
        return "Age unknown"
    }
    
}

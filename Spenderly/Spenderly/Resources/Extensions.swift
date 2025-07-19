//
//  Extensions.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import Foundation
import  SwiftUI
 

extension Color{
    static let Background = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
     
}

// date formating

extension DateFormatter{
  
    static let allNumeric : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/DD/YYYY"
        
        return formatter
    }()
    
}



// converting date into string
extension String {
    
    func dateParsed()->Date{
        
        guard let parsedDate = DateFormatter.allNumeric.date(from: self) else {return Date()}
        
        return parsedDate
    }
    
}

extension Date: Strideable{
    
    func formatted() -> String{
        
        return self.formatted(.dateTime.year().month().day() )
    }
}

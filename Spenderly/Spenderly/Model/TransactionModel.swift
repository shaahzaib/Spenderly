//
//  TransactionModel.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import Foundation

struct TransactionModel:Identifiable,Decodable,Hashable
{
    let id:Int
    let date:String
    let institution:String
    let account:String
    let merchant:String
    let amount:Double
    let type:TransactionType.RawValue
    let categoryId:Int
    let category:String
    var isPending:Bool
    var isTransfer:Bool
    var isExpense:Bool
    var isEdited:Bool
    
    var icon : String{
    
        if let category  = Category.all.first(where: {$0.id == categoryId}){
            return category.icon
        }
        return "questionmark"
    }
    
    var dateParsed:Date{
        date.dateParsed()
    }
 
    var signedAmount:Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month:String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
    
}

enum TransactionType:String{
    case debit = "debit"
    case credit = "credit"
}

struct Category{
    let id :Int
    let name: String
    let icon: String
    var mainCateogry:Int?
}


extension Category{
    
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: "car")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: "lightbulb")
    static let entertainment = Category(id: 3, name: "Entertainment", icon: "film")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: "receipt")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: "fork.knife")
    static let home = Category(id: 6, name: "Home", icon: "house")
    static let income = Category(id: 7, name: "Income", icon: "dollarsign.circle")
    static let shopping = Category(id: 8, name: "Shopping", icon: "cart")
    static let transfer = Category(id: 9, name: "Transfer", icon: "arrow.2.squarepath")

    // Subcategories for "Auto & Transport"
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: "bus", mainCateogry: 1)
    static let fuel = Category(id: 102, name: "Taxi", icon: "car", mainCateogry: 1)
    static let carMaintenance = Category(id: 103, name: "Car Maintenance", icon: "wrench", mainCateogry: 1)

    // Subcategories for "Bills & Utilities"
    static let electricity = Category(id: 201, name: "Electricity", icon: "bolt", mainCateogry: 2)
    static let water = Category(id: 202, name: "Water", icon: "drop", mainCateogry: 2)
    static let internet = Category(id: 203, name: "Internet", icon: "wifi", mainCateogry: 2)

    // Subcategories for "Entertainment"
    static let movies = Category(id: 301, name: "Movies", icon: "film", mainCateogry: 3)
    static let concerts = Category(id: 302, name: "Concerts", icon: "music.note", mainCateogry: 3)
    static let games = Category(id: 303, name: "Games", icon: "gamecontroller", mainCateogry: 3)

    // Subcategories for "Fees & Charges"
    static let bankFees = Category(id: 401, name: "Bank Fees", icon: "building.columns", mainCateogry: 4)
    static let lateFees = Category(id: 402, name: "Late Fees", icon: "clock.arrow.circlepath", mainCateogry: 4)

    // Subcategories for "Food & Dining"
    static let restaurants = Category(id: 501, name: "Restaurants", icon: "fork.knife", mainCateogry: 5)
    static let coffeeShops = Category(id: 502, name: "Coffee Shops", icon: "cup.and.saucer", mainCateogry: 5)
    static let groceries = Category(id: 503, name: "Groceries", icon: "cart", mainCateogry: 5)

    // Subcategories for "Home"
    static let rent = Category(id: 601, name: "Rent", icon: "house", mainCateogry: 6)
    static let maintenance = Category(id: 602, name: "Maintenance", icon: "hammer", mainCateogry: 6)

    // Subcategories for "Income"
    static let salary = Category(id: 701, name: "Salary", icon: "dollarsign.circle", mainCateogry: 7)
    static let investment = Category(id: 702, name: "Investment", icon: "chart.line.uptrend.xyaxis", mainCateogry: 7)

    // Subcategories for "Shopping"
    static let clothing = Category(id: 801, name: "Clothing", icon: "tshirt", mainCateogry: 8)
    static let electronics = Category(id: 802, name: "Electronics", icon: "desktopcomputer", mainCateogry: 8)

    // Subcategories for "Transfer"
    static let bankTransfer = Category(id: 901, name: "Bank Transfer", icon: "arrow.left.arrow.right", mainCateogry: 9)
    static let cash = Category(id: 902, name: "Cash", icon: "banknote", mainCateogry: 9)

}


extension Category{
    static let categories : [Category] = [
        .autoAndTransport,

            .billsAndUtilities,
        .entertainment,
            .feesAndCharges,
            .foodAndDining,
            .home,
            .income,
            .shopping,
            .transfer
    ]
    
    static let subcategories: [Category] = [
        // Subcategories for "Auto & Transport"
        .publicTransportation,
        .fuel,
        .carMaintenance,

        // Subcategories for "Bills & Utilities"
        .electricity,
        .water,
        .internet,

        // Subcategories for "Entertainment"
        .movies,
        .concerts,
        .games,

        // Subcategories for "Fees & Charges"
        .bankFees,
        .lateFees,

        // Subcategories for "Food & Dining"
        .restaurants,
        .coffeeShops,
        .groceries,

        // Subcategories for "Home"
        .rent,
        .maintenance,

        // Subcategories for "Income"
        .salary,
        .investment,

        // Subcategories for "Shopping"
        .clothing,
        .electronics,

        // Subcategories for "Transfer"
        .bankTransfer,
        .cash
    ]

    static let all:[Category] = categories + subcategories
}


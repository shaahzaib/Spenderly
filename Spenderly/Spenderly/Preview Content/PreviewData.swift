//
//  PreviewData.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import Foundation

var TransactionPreviewData = TransactionModel(id: 1, date: "04/06/2025", institution: "BiteWise", account: "Visa BiteWise", merchant: "Apple", amount: 50, type: "debit", categoryId: 804, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var TransactionListPreviewData = [TransactionModel](repeating: TransactionPreviewData, count: 10)
 

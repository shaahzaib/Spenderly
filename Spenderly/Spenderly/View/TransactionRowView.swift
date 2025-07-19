//
//  TransactionRowView.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI

struct TransactionRowView: View {
    
    var transaction : TransactionModel
    
    var body: some View {
        HStack(spacing: 20){
            
            // icon
            
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .fill(Color.icon.opacity(0.4))
                .frame(width: 44, height: 44)
                .overlay{
                    Image(systemName: "\(transaction.icon)")
                        .imageScale(.large)
                }
            
            
            VStack(alignment: .leading,spacing: 6){
                
                //merchant
                
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // category
                
                Text(transaction.category)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                //date
                
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                
                
            }
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? .green : .primary)
                 
            
            
        }.padding([.top, .bottom],8)
    }
}

#Preview {
    TransactionRowView(transaction: TransactionPreviewData)
}


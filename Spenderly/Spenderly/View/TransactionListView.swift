//
//  TransactionListView.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var transactionListVM:TransactionListViewModel
    var body: some View {
        VStack{
            
            List{
                
                ForEach(Array(transactionListVM.groupTransactionsByMonth()),id: \.key){month, transactions in
                    Section {
                        ForEach(transactions){transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
               
                
            }
            .listStyle(.plain)
            
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionListView_Previews: PreviewProvider{
   
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        
        return transactionListVM
    }()
    
    
    static var previews: some View{
        NavigationView{
            TransactionListView()
        }
            .environmentObject(transactionListVM)
    }
}


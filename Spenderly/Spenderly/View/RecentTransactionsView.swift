//
//  RecentTransactionsView.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI

struct RecentTransactionsView: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack
        {
            HStack{
                
                Text("Recent Transactions")
                    .bold()
                Spacer()
                
                NavigationLink {
                    TransactionListView()
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                            
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.Text)
                }
                
            }.padding(.top)
            
            
            // recent transactions
            
            ForEach(transactionListVM.transactions.prefix(5)){transaction in
                
                TransactionRowView(transaction: transaction)
                
            }
                
                   
            
         
            
        }.padding()
            .background(Color.background)
            .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
            .shadow(color: .primary.opacity(0.3),radius: 10)
   
            
    }
        
}

struct RecentTransactionsView_Previews: PreviewProvider{
   
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        
        return transactionListVM
    }()
    
    
    static var previews: some View{
        RecentTransactionsView()
            .environmentObject(transactionListVM)
    }
}



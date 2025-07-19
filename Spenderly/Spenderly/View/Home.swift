//
//  Home.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(alignment: .leading,spacing: 24){
                    //MARK: -Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: - Chart
                    ChartView()
                    
                    //MARK:  - Transaction List
                    
                    RecentTransactionsView()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //MARK: - Notification icon
                
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.icon,.primary)
                }

            }
            
        }.navigationViewStyle(.stack)
            .accentColor(.primary)
    }
}

struct Home_Previews: PreviewProvider{
   
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        
        return transactionListVM
    }()
    
    
    static var previews: some View{
        Home()
            .environmentObject(transactionListVM)
    }
}

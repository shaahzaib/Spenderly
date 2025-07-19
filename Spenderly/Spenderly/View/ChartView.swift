//
//  ChartView.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    
    @EnvironmentObject var transactionListVM:TransactionListViewModel
    
    var demoData: [Double] = [80, 400, 60.10, 200.10,110.17, 90.30, 280]
    var body: some View {
        
        //let data = transactionListVM.accumlateTrannsactions()
       // let totalExpenses = data.last?.1 ?? 0
        
        CardView{
            VStack {
                ChartLabel("$1020.67",type: .title,format: "$%0.2f")
            }
            LineChart()
        }
        .data(demoData)
        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4),Color.icon)))
        .frame(height: 300)
    }
}

struct ChartView_Previews: PreviewProvider{
   
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        
        return transactionListVM
    }()
    
    
    static var previews: some View{
        NavigationView{
           ChartView()
        }
            .environmentObject(transactionListVM)
    }
}

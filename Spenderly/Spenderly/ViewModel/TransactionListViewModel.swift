//
//  TransactionListViewModel.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String,[TransactionModel]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject{
    
    @Published var transactions: [TransactionModel] = []
    
    private var cancelLables = Set<AnyCancellable>()
    
    init(){
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json")
        else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{(data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [TransactionModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case.failure(let error):
                    print("Error in fetching transactions",error.localizedDescription)
                case.finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: {  [weak self] result in
                self?.transactions=result
               
                
            }.store(in: &cancelLables)
        

    }
        
    
    func groupTransactionsByMonth() ->TransactionGroup{
        guard !transactions.isEmpty else {return [:]}
        
        let groupedTransactions = TransactionGroup(grouping: transactions) {$0.month}
        return groupedTransactions
    }
    
    // to gether transactions
    func accumlateTrannsactions() -> TransactionPrefixSum{
        
        print("Accumlations of Transactions")
        guard !transactions.isEmpty else {
            return []
        }
        
        let today = "02/16/2022".dateParsed()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval",dateInterval)
        
        var sum:Double = .zero
        var cumulativeSum = TransactionPrefixSum()
       
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24){
            
            let dailyExpenses = transactions.filter{$0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0){ $0-$1.signedAmount}
            
            sum += dailyTotal
            cumulativeSum.append((date.formatted(),sum))
            print(date.formatted(),"dailyTotal: ",dailyTotal,"sum: ",sum)
        }
        
        return cumulativeSum
    }
    
}


//
//  SpenderlyApp.swift
//  Spenderly
//
//  Created by Macbook Pro on 06/06/2025.
//

import SwiftUI

@main
struct SpenderlyApp: App {
    
    @StateObject var transactionListVM = TransactionListViewModel()
    @State private var showSplashScreen = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !showSplashScreen {
                    Home()
                        .environmentObject(transactionListVM)
                } else {
                    SplashScreenView()
                }
            } .onAppear {
                // Hide splash screen after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                    withAnimation {
                        showSplashScreen = false
                    }
                }
            }
            
        }
    }
}



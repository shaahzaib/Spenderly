//
//  SplashScreen.swift
//  Spenderly
//
//  Created by Macbook Pro on 07/06/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimating = false
    let primaryColor = Color(red: 0.3, green: 0.5, blue: 0.7)
    let secondaryColor = Color(red: 0.9, green: 0.95, blue: 1.0)
    
    var body: some View {
        VStack {
            // Animated logo
            ZStack {
                Circle()
                    .fill(secondaryColor.opacity(0.3))
                    .frame(width: 150, height: 150)
                    .scaleEffect(isAnimating ? 1.4 : 0.8)
                    .opacity(isAnimating ? 0 : 1)
                
                Circle()
                    .fill(secondaryColor.opacity(0.6))
                    .frame(width: 120, height: 120)
                    .scaleEffect(isAnimating ? 1.7 : 0.5)
                
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(primaryColor)
                    .scaleEffect(isAnimating ? 1.3 : 0.9)
            }
            
            // App name
            Text("Spenderly")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(primaryColor)
                .padding(.top, 30)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                isAnimating = true
            }
        }
    }
}

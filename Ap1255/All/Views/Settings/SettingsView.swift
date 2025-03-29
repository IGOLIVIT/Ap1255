//
//  SettingsView.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/92bf2908-9f14-4adb-9fbb-bd2dee55bf8c") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                    .padding(.horizontal)
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black.opacity(0.6))
                                    .font(.system(size: 17, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                    .padding(.horizontal)
                                
                                Text("Rate us")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black.opacity(0.6))
                                    .font(.system(size: 17, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

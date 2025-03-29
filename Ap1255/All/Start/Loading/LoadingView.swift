//
//  LoadingView.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), Color("bg")], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 80)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}

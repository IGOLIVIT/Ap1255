//
//  GuidesView.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct GuidesView: View {
    
    @StateObject var viewModel = GuidesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Guides")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.guides, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedGuide = index
                                                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Text(index.number)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                                    
                                    Text(index.name)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Text(index.read ? "Read" : "Not read")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 14).fill(index.read ? Color("prim2") : Color("prim3")))
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("bg2")))
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            GuideDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    GuidesView()
}

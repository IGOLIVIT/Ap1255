//
//  GuidesDetail.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct GuideDetail: View {

    @StateObject var viewModel: GuidesViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.selectedGuide?.read = true

                            viewModel.isDetail = false
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.selectedGuide?.read = true

                            viewModel.isDetail = false
                            
                        }, label: {

                            Text("Done")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                    }
                    .padding(.vertical)
                    
                    Text(viewModel.selectedGuide?.name ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            Text(viewModel.selectedGuide?.text ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim3")))
                        .padding()
                    }
                
            }
        }
    }
}

#Preview {
    GuideDetail(viewModel: GuidesViewModel())
}

//
//  TrackNumbers.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct TrackNumbers: View {

    @StateObject var viewModel: TrackerViewModel
    @Environment(\.presentationMode) var down
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.addGoal = ""
                            viewModel.addMatch = ""
                            viewModel.addOppo = ""
                            
                            withAnimation(.spring()) {
                                
                                down.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {

                            viewModel.goals = viewModel.addGoal
                            viewModel.matches = viewModel.addMatch
                            viewModel.Opponents = viewModel.addOppo
                            
                            viewModel.addGoal = ""
                            viewModel.addMatch = ""
                            viewModel.addOppo = ""
                            
                            withAnimation(.spring()) {
                                
                                down.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Text("Done")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })

                    }
                    .padding(.vertical)
                    
                    Text("Training")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 34, weight: .bold))
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        HStack {
                            
                            Text("Goals")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("How many goals have you scored?")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.addGoal.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addGoal)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Matches")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("How many matches have you played?")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.addMatch.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addMatch)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Opponents")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("How many opponents have you defeated?")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.addOppo.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addOppo)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 17).fill(.white))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    TrackNumbers(viewModel: TrackerViewModel())
}

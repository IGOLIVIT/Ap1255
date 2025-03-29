//
//  NewTracker.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct NewTracker: View {

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

                            viewModel.addTrain()
                            
                            viewModel.tTrain = ""
                            viewModel.tDescr = ""
                            viewModel.tDate = ""
                            viewModel.tPlace = ""
                            viewModel.tTime = ""
                            
                            viewModel.fetchTrains()
                            
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
                            
                            Text("Training")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("what are you training")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.tTrain.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tTrain)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Description")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("workout description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.tDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tDescr)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Training date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.tDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tDate)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Place")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Place for training")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.tPlace.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tPlace)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Training time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.tTime.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tTime)
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
    NewTracker(viewModel: TrackerViewModel())
}

//
//  TrackerView.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct TrackerView: View {
    
    @StateObject var viewModel = TrackerViewModel()

    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Tracker")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(Color("prim"))
                    .ignoresSafeArea()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddStat = true
                    }
                    
                }, label: {
                    
                    Image("bgf")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                        .overlay(
                            
                            HStack {
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text("\(viewModel.goals) goals")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text("\(viewModel.matches) matches")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text("\(viewModel.Opponents) opponents")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                                .padding(.horizontal, 30)
                        )
                })
                
                if viewModel.trains.isEmpty {
                    
                    VStack {
                        
                        Text("Here you can add your notes for the future")
                            .foregroundColor(Color("prim3"))
                            .font(.system(size: 26, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.top)
                        
                        Spacer()
                    }
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.trains, id: \.self) { index in
                            
                            VStack(spacing: 18) {
                                
                                HStack {
                                    
                                    Text(index.tDate ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                        .padding(.horizontal)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        
                                        Text(index.tTime ?? "")
                                            .foregroundColor(Color("prim3"))
                                            .font(.system(size: 17, weight: .semibold))
                                            .padding(6)
                                            .frame(width: 100)
                                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                                            .padding(.trailing)
                                        
                                        Spacer()
                                        
                                    }
                                }
                                .frame(height: 40)
                                
                                HStack {
                                    
                                    Text(index.tDescr ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text("\(index.tTrain ?? "")")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)

                                Button(action: {
                                    
                                    viewModel.selectedTrain = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .regular))
                                })
                                .padding(6)
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim3")))
                            .padding()
                        }
                    }
                }
            }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add training")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim3")))
                })
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            NewTracker(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddStat, content: {
            
            TrackNumbers(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchTrains()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {
                    
                    Text("Are you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteTrain(withTTrain: viewModel.selectedTrain?.tTrain ?? "", completion: {
                                
                                viewModel.fetchTrains()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TrackerView()
}

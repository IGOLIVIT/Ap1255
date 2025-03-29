//
//  NewNote.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct NewNote: View {

    @StateObject var viewModel: CalendarViewModel
    @Environment(\.presentationMode) var down
    
    var body: some View {

        ZStack {
            
            Color.white
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
                            
                            viewModel.addNote()
                            
                            viewModel.nName = ""
                            viewModel.nT1 = ""
                            viewModel.nT2 = ""
                            viewModel.nDate = ""
                            viewModel.nCheck = ""
                            
                            viewModel.fetchNotes()
                            
                            withAnimation(.spring()) {
                                
                                down.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Text("Done")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        .opacity(viewModel.nName.isEmpty || viewModel.nT1.isEmpty || viewModel.nT2.isEmpty || viewModel.nDate.isEmpty ? 0.6 : 1)
                        .disabled(viewModel.nName.isEmpty || viewModel.nT1.isEmpty || viewModel.nT2.isEmpty || viewModel.nDate.isEmpty ? true : false)
                    }
                    .padding(.vertical)
                    
                    Text("New Note")
                        .foregroundColor(.black)
                        .font(.system(size: 34, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Note title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.nName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.nName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Team")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Your football team name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.nT1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.nT1)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Team 2")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Your opponent's team")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.nT2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.nT2)
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
                                
                                Text("Match date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.nDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.nDate)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Check")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Team score")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .opacity(viewModel.nCheck.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.nCheck)
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
                .background(Image("ibg").resizable())
                .background(Color("bg"))
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    NewNote(viewModel: CalendarViewModel())
}

//
//  CalendarView.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    @State private var currentDate = Date()  // Текущий месяц
    private let calendar = Calendar.current
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy" // "Март 2025"
        return formatter
    }()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("ibg").resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack {
                            // Название месяца и кнопки переключения
                            HStack {
                                Button(action: previousMonth) {
                                    Image(systemName: "chevron.left")
                                        .padding()
                                }
                                
                                Spacer()
                                
                                Text(formatter.string(from: currentDate))
                                    .font(.system(size: 16, weight: .semibold))
                                    .bold()
                                
                                Spacer()
                                
                                Button(action: nextMonth) {
                                    Image(systemName: "chevron.right")
                                        .padding()
                                }
                            }
                            .padding(.horizontal)
                            
                            // Дни недели
                            let weekDays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
                            HStack {
                                ForEach(weekDays, id: \.self) { day in
                                    Text(day)
                                        .foregroundColor(.gray.opacity(0.7))
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .font(.headline)
                                }
                            }
                            .padding(.horizontal)
                            
                            // Сетка с днями
                            let days = getDaysInMonth()
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                                ForEach(days, id: \.self) { day in
                                    if let day = day {
                                        Text("\(day)")
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(width: 30, height: 30)
                                            .background(Color.blue.opacity(0.1))
                                            .clipShape(Circle())
                                    } else {
                                      
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        .padding()
                        
                        ForEach(viewModel.notes, id: \.self) { index in
                        
                            VStack(spacing: 18) {
                                
                                HStack {
                                    
                                    Text(index.nDate ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text(index.nName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                }
                                
                                HStack {
                                    
                                    Text(index.nCheck ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text("\(index.nT1 ?? "")/\(index.nT2 ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                }
                                
                                Rectangle()
                                    .fill(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Button(action: {
                                    
                                    viewModel.selectedNote = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .regular))
                                })
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.white))
                            .padding()
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
                    
                    Text("Add a note")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                })
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            NewNote(viewModel: viewModel)
        })
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
                            
                            CoreDataStack.shared.deleteNote(withNName: viewModel.selectedNote?.nName ?? "", completion: {
                                
                                viewModel.fetchNotes()
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
    
    // Получаем количество дней в месяце и сдвиг
    private func getDaysInMonth() -> [Int?] {
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let firstWeekday = calendar.component(.weekday, from: calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!) - 1
        let shift = (firstWeekday == 0 ? 6 : firstWeekday) // Сдвиг, чтобы неделя начиналась с понедельника
        return Array(repeating: nil, count: shift) + Array(range)
    }
    
    // Переключение месяца назад
    private func previousMonth() {
        currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
    }
    
    // Переключение месяца вперед
    private func nextMonth() {
        currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)!
    }
}

#Preview {
    CalendarView()
}

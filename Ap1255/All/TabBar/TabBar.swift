//
//  TabBar.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Rectangle()
                            .fill(.gray.opacity(0.13))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim3") : Color.gray)
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim3") : Color.gray)
                            .font(.system(size: 11, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("tbg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Guides = "Guides"
    
    case Tracker = "Tracker"
    
    case Calendar = "Calendar"
    
    case Settings = "Settings"

}

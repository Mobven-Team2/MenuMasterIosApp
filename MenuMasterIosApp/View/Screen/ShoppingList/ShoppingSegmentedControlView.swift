//
//  ShoppingSegmentedControlView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/12/24.
//

import SwiftUI

struct ShoppingSegmentedControlView: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id: \.self) { index in
                VStack {
                    Text(options[index])
                        .font(.poppins(size: 14))
                        .fontWeight(.regular)
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                preselectedIndex = index
                            }
                        }
                    Rectangle()
                        .fill(preselectedIndex == index ? Color.theme.primaryOrangeColor : Color.clear)
                        .frame(height: 3)
                        
                }
            }
        }
        .frame(height: 54)
        
        

    }
}


#Preview {
    ShoppingSegmentedControlView(preselectedIndex: .constant(0), options: ["Kahvaltı", "Ara Öğün", "Öğle", "Akşam"])
}

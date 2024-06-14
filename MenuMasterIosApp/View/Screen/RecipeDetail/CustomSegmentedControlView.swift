//
//  CustomSegmentedControlView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/10/24.
//

import Foundation
import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    
    let color = Color.theme.primaryGreenColor
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                ForEach(options.indices, id:\.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .foregroundColor(.black)
                        
                        Rectangle()
                            .fill(color)
                            .cornerRadius(20)
                            .padding(2)
                            .opacity(preselectedIndex == index ? 1 : 0.01)
                            .onTapGesture {
                                withAnimation(.interactiveSpring()) {
                                    preselectedIndex = index
                                }
                            }
                    }
                    .overlay(
                        Text(options[index])
                    )
                }
            }
            .frame(height: 54)
            .cornerRadius(20)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CustomSegmentedControl(preselectedIndex: .constant(0), options: ["djn","djnd"])
}

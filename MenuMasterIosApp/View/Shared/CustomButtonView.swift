//
//  CustomButtonView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/29/24.
//

import SwiftUI

struct CustomButtonView: View {
    let text: String
    @Binding var isButtonTapped: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            isButtonTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                action()
                isButtonTapped = false
                
            }
        }) {
            if !isButtonTapped{
                Text(text)
            } else {
                ProgressView()
            }
        }
        .customButtonStyle()
        .padding(.bottom, 18)
    }
}



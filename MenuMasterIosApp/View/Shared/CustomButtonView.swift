//
//  CustomButtonView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/29/24.
//

import SwiftUI

struct CustomButtonView: View {
    let text: String
    @Binding var isButtonTapped : Bool
    let action: () -> Void
    

    var body: some View {
        Button(action: {
            isButtonTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               action()
            }
        }) {
            if !isButtonTapped {
                Text(text)
            } else {
                ProgressView()
                    .foregroundColor(.white)
            }
        }
        .customButtonStyle()
        .padding(.bottom, 18)
    }
}


//#Preview {
//    StatefulPreviewWrapper(false) { isTapped in
//        AnyView(CustomButtonView(text: "Devam Et", isButtonTapped: isTapped) {
//            // Action to perform
//        })
//    }
//}

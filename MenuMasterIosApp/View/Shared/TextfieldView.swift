//
//  TextfieldView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/24/24.
//

import SwiftUI

struct TextfieldView: View {
    let title: String
    let placeholder: String
    let isPasswordField: Bool
    var errorMessage: String = ""
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .formTitleStyle()
            
            if isPasswordField {
                // securefield kaldırdım
                TextField(placeholder, text: $text)
                    .customTextFieldStyle()
                
            } else {
                TextField(placeholder, text: $text)
                    .customTextFieldStyle()
            }
            
            Text(errorMessage)
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    @State static var sampleText = "Sample Name"
    
    static var previews: some View {
        TextfieldView(title: "İsim Soyisim", placeholder: "Jane Doe", isPasswordField: false, text: $sampleText)
            .previewLayout(.sizeThatFits)
    }
}

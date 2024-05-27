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
    var errorMessage: String?
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .formTitleStyle()
            
            if isPasswordField {
                SecureField(placeholder, text: $text)
                    .customTextFieldStyle()
                    .overlay( errorMessage == nil ? RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.white) : RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.red))
            } else {
                TextField(placeholder, text: $text)
                    
                    .customTextFieldStyle()
<<<<<<< HEAD
                    
=======
                    .overlay( errorMessage == nil ? RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.white) : RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.red))
>>>>>>> 7f8e41b (start of password check)
            }
            
            Text(errorMessage ?? "")
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

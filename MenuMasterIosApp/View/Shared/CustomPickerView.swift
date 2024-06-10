//
//  CustomPickerView.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/28/24.
//

import SwiftUI

struct CustomPickerView<T: CaseIterable & Identifiable & Hashable & CustomStringConvertible>: View {
    var title: String
    @Binding var selection: T?
    var options: [T]
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .formTitleStyle()
            
            HStack {
                Text(selection?.description ?? placeholder)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.poppins(size: 14))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Menu {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selection = option
                        }) {
                            Text(option.description)
                        }
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(Color.theme.primaryTextColor)
                        .frame(width: 12, height: 8)
                }
                .padding(.trailing, 16)
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 48, minHeight: 47)
            .background(Color.theme.textfieldBgColor)
            .cornerRadius(8)
        }
    }
}




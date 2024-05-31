//
//  CheckboxToggleStyle.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 31.05.2024.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    private var isOn: Bool = false
    
    init(isOn: Bool) {
        self.isOn = isOn
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        Button(action: {
            
            configuration.isOn.toggle()

        }, label: {
            HStack {
                
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        }).foregroundColor(isOn ? .black : .red)
    }
}

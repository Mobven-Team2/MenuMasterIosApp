//
//  Font+Ext.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 5/22/24.
//


import SwiftUI

extension Font {
    static func chillaxVariable(size: CGFloat) -> Font {
        return .custom("Chillax Variable", size: size)
        
    }
    
    static func dmSans(size: CGFloat) -> Font {
        return .custom("DM Sans", size: size)
    }
    
    
    static func poppins(size: CGFloat) -> Font {
        return .custom("Poppins-Regular", size: size)
    }
}

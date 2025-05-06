//
//  CustomBackGroundView.swift
//  ChangeAppIcon
//
//  Created by Ani on 04/05/25.
//

import SwiftUI

struct CustomBackGroundView: View {
    var body: some View {
        ZStack {
            
            // Mark: - 3 Depth
            Color.customGrayDark
                .cornerRadius(40)
                .offset(y:12)
            // Mark: - 2 Light
            
            Color.customGrayLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)

            
            // Mark: - 1 Surface
            
            LinearGradient(colors: [Color.customGrayLight,
                                    Color.customGrayMedium],
                           startPoint: .top,
                           endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackGroundView()
        .padding()
}

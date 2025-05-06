//
//  CustomButton.swift
//  ChangeAppIcon
//
//  Created by Ani on 04/05/25.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [.customGreenLight,.customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                )
                Circle()
                    .stroke(LinearGradient(
                        colors: [.customGrayLight,.customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom),
                            lineWidth: 4)
            Image(systemName: "numbersign")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
        }// ZStack
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButton()
        .padding()
}

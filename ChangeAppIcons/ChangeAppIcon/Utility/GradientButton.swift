//
//  GradientButton.swift
//  ChangeAppIcon
//
//  Created by Ani on 04/05/25.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ? LinearGradient(
                    colors: [.gray,.customGrayMedium],
                startPoint: .top,
                endPoint: .bottom) : LinearGradient(
                    colors: [.gray,.customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom)
            )// background
            .cornerRadius(40)
    }
}

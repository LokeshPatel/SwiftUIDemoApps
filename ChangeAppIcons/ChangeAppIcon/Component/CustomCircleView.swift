//
//  CustomCircleView.swift
//  ChangeAppIcon
//
//  Created by Ani on 04/05/25.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    var body: some View {
        Circle()
            .fill(LinearGradient(
                colors: [.customGreenMedium,.customGreenDark],
                startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                endPoint: isAnimateGradient ? .bottomLeading : .topLeading
            )
            )
            .onAppear{
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                    isAnimateGradient.toggle()
                }
            }
        
            .frame(width: 256,height: 256)
    }
}

#Preview {
    CustomCircleView()
}

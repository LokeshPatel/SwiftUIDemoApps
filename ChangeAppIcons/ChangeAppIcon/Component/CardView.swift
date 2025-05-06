//
//  CardView.swift
//  ChangeAppIcon
//
//  Created by Ani on 04/05/25.
//

import SwiftUI

struct CardView: View {
    // Mark : Properties
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    // Mark : - functions
    func randomImagePick(){
        repeat {
            randomNumber = Int.random(in: 1...9)
        } while  imageNumber == randomNumber
                    
        imageNumber = randomNumber
    }
    // Mark: - body
    var body: some View {
        // Mark : Card View Stack
        ZStack {
            CustomBackGroundView()
            VStack {
                // Mark - Header
                VStack (alignment: .leading) {
                    HStack {
                        Text("Count")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [.customGreenLight,
                                         .customGreenDark],
                                startPoint: .top,
                                endPoint: .bottom))
                        Spacer()
                        Button{
                            print("Test Click button")
                            isShowingSheet.toggle()
                        } label:{
                            CustomButton()
                        }
                        .sheet(isPresented:$isShowingSheet){
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                
                Text("Number Count Slider View Controller in SwiftUI")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundStyle(LinearGradient(
                        colors: [.customGreenMedium],
                        startPoint: .top,
                        endPoint: .bottom))
                } // VStack : Header
                .padding(.horizontal, 20)
                // Mark - Main Content
                ZStack {
                    CustomCircleView()
                    Image("Number-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,value:imageNumber)
                }
                // Mark - Footer
            
                Button {
                    randomImagePick()
                } label: {
                    Text("Show Numbers")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [.customGreenLight,.customGreenLight],
                            startPoint: .top,
                            endPoint: .bottom)
                        ).shadow(color:.black.opacity(0.25),
                                radius: 0.25,
                                x:1, y:2)
                }
                .buttonStyle(GradientButton())
            } // VStack
           
        }// Card - ZStack
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}

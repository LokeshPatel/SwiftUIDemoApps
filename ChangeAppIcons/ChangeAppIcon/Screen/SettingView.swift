//
//  SettingView.swift
//  ChangeAppIcon
//
//  Created by Ani on 05/05/25.
//

import SwiftUI

struct SettingView: View {
    private let alternativeappicons:[String] = [
        "Number-1",
        "Number-2",
        "Number-3",
        "Number-4",
        "Number-5",
        "Number-6",
        "Number-7",
        "Number-8",
        "Number-9"
    ]
    
    var body: some View {
        List {
            // Mark : Section - Header
            Section {
                HStack (alignment: .center){
                    Spacer(minLength: 5)
                    Image(systemName: "laurel.leading")
                        .font(.system(size:80, weight: .black))
                    VStack (spacing: -5) {
                        Text("App icon")
                            .font(.system(size: 40, weight: .black))
                        Text("Change app icon")
                            .font(.system(size: 20, weight: .black))
                        
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size:80, weight: .black))
                    Spacer(minLength: 5)
                }
                .foregroundStyle(LinearGradient(
                    colors: [.customGreenMedium,.customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom)
                )
                .padding(.top,10)
                VStack {
                    Text("Show setting view and Display icons for update app icons dynamically")
                        .font(.footnote)
                        .italic()
                        .padding(.bottom, 10)
                    
                    Text("Select icons and Update app icons")
                        .font(.system(size:15, weight: .heavy))
                        .foregroundStyle(LinearGradient(colors: [.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                }
                .multilineTextAlignment(.center)
            }.listRowSeparator(.hidden) // Header sections
            
            // Mark : Section - icons
            Section ( header : Text("App icons"))
            {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack {
                        ForEach(alternativeappicons.indices, id:\.self ) { item in
                            Button {
                                let iconName = "AppIcon-\(alternativeappicons[item])"
                                print("icon click for change app logo \(iconName)")
                                UIApplication.shared.setAlternateIconName(iconName){ error in
                                    if error != nil {
                                        print("failed app icon update \(String(describing:error?.localizedDescription))")
                                    } else {
                                        print("Successfully app icon update \(alternativeappicons[item])")
                                    }
                                    
                                }
                                
                            } label:{
                                Image("\(alternativeappicons[item])").resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .background(.gray)
                                    .cornerRadius(10)
                            }// Button with icons
                            .buttonStyle(.borderless)
                            .padding(.top,10)
                        }
                    }// ForEach
                }// Scroll View
                Text("Choice App icons for the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
              
            }.listRowSeparator(.hidden)
            
            // Mark : Section - About
            Section(
                header: Text("About The App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright @ all right reserved.")
                    Spacer()
                } .padding(.bottom, 10)
            ){
              // Lable Content in Swift UI
               // LabeledContent("Application", value :"Chanege App icon")
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowValue: "Change App icon", rowColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowValue: "iPhone,iPad", rowColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowValue: "SwiftUI", rowColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowValue: "1.0", rowColor: .purple)

                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowValue: "Patel Lokesh", rowColor: .mint)
                
            }
             
        }
    }
}

#Preview {
    SettingView()
}

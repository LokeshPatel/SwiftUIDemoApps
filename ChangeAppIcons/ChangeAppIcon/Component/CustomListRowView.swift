//
//  CustomListView.swift
//  ChangeAppIcon
//
//  Created by Ani on 05/05/25.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel : String
    @State var rowIcon : String
    @State var rowValue: String
    @State var rowColor: Color
    
    var body: some View {
        //Label Content Custom icons
        LabeledContent {
            Text(rowValue)
                .foregroundStyle(.primary)
                .fontWeight(.bold)
        } label: {
            
            HStack {
                Image(systemName: rowIcon)
                    .frame(width: 30,height: 30)
                    .foregroundStyle(LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom))
                    .fontWeight(.semibold)
                    .background(rowColor)
                    .cornerRadius(10)
                   Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Application",
                       rowIcon: "apps.iphone",
                       rowValue: "showAppName",
                       rowColor: .red)
    }
}

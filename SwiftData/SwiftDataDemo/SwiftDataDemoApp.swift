//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Ani on 06/05/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Note.self)
        }
    }
}

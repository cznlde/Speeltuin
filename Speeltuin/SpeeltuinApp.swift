//
//  SpeeltuinApp.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

@main
struct SpeeltuinApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyModelOld()) //pre iOS 17
                .environment(MyModel()) // iOS 17 and newer
            
        }
    }
}

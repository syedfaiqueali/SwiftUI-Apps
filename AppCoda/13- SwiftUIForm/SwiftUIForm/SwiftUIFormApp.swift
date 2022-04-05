//
//  SwiftUIFormApp.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

@main
struct SwiftUIFormApp: App {
    let settingStore = SettingStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingStore)
        }
    }
}

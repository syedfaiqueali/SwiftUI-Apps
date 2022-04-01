//
//  SwiftUIFormApp.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

@main
struct SwiftUIFormApp: App {
    var body: some Scene {
        let settingStore = SettingStore()
        WindowGroup {
            ContentView(settingStore: settingStore)
        }
    }
}

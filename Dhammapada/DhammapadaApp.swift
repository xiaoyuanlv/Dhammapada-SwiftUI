//
//  DhammapadaApp.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

@main
struct DhammapadaApp: App {
    @StateObject var appDataManager = AppDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDataManager)
        }
    }
}

//
//  ContentView.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appDataManager: AppDataManager
    
    var body: some View {
       SplashView()
            .environmentObject(appDataManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(appDataManager)
    }
}

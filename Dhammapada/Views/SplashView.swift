//
//  SplashScreen.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI


struct SplashView: View {
    
    @EnvironmentObject var appDataManager : AppDataManager
    @State var showSecondView = false
  
    var body: some View {
        
        if showSecondView {
            CategoryView()
                .environmentObject(appDataManager)
                .transition(.moveAndFade)
        } else {
        
            NavigationView {
                
                VStack(alignment: .center) {
                    
                        Spacer()
                        
                        Image("lotus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 77, height: 77)
                            
                        Text("Dhammapada")
                            .lotusTitle()
                            
                        Text("ဓမ္မပဒ").foregroundColor(.white)
                        
                        Spacer()
                        
        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background"))
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
                        withAnimation {
                            self.showSecondView.toggle()
                        }
                }
            }
            
        }
        
    }
    
}
    
    

struct SplashView_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        SplashView().environmentObject(appDataManager)
    }
}

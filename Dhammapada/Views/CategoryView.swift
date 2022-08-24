//
//  CategoryView.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

struct CategoryView: View {
  
    @EnvironmentObject var appDataManager : AppDataManager
    
    var body: some View {
        
        if(UIDevice.current.userInterfaceIdiom == .pad) {
            NavigationView {
                CategoryListView()
                    .environmentObject(appDataManager)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear(perform: {
                appDataManager.getCategories()
            })
        } else {
            NavigationView {
                CategoryListView()
                    .environmentObject(appDataManager)
            }
            .onAppear(perform: {
                appDataManager.getCategories()
            })
        }
        
       
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        Group {
            NavigationView {
                CategoryView()
            }
            NavigationView {
                CategoryView()
                    .preferredColorScheme(.dark)
            }
        }.environmentObject(appDataManager)
    }
}



struct CategoryListView: View {
    
    var columns = UIDevice.current.userInterfaceIdiom == .phone ? [GridItem(.adaptive(minimum: 140), spacing: 20)] : [GridItem(.adaptive(minimum: 170), spacing: 20)]
    @EnvironmentObject var appDataManager : AppDataManager
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 20) {
                    Image("lotus").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    
                    Spacer()
                    
                    Button {
                        appDataManager.changeDarkMode(state: !appDataManager.isDarkModeOn)
                    } label: {
                        RoundedButton(text: appDataManager.isDarkModeOn ? "star.fill" : "sun.max.fill", background: Color.button, textColor: .white)
                            .padding()
                    }
                    
                    NavigationLink {
                        BookmarkListView()
                            .environmentObject(appDataManager)
                    } label: {
                        RoundedButton(text: "book.circle.fill", background: Color.button, textColor: .white)
                            .padding()
                    }
                    
                    Button {
                        showingAlert = true
                    } label: {
                        RoundedButton(text: "info.circle", background: Color.button, textColor: .white)
                            .padding()
                    }.alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Dhammapada (ဓမ္မပဒ)"),
                            message: Text("The Dhammapada is a collection of sayings of the Buddha in verse form and one of the most widely read and best known Buddhist scriptures. With ( English, Myanmar, Burmese: ပါဠိ Pali). Version 1.4"),
                            dismissButton: .default(Text("Close"))
                        )
                        
                    }
                    
                }
                .padding()
                
                HStack {
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(appDataManager.categoryList, id: \.id) { category in
                                    NavigationLink {
                                        DhammaListView(category: category)
                                            .environmentObject(appDataManager)
                                    } label: {
                                        CategoryCard(category: category).animation(.ripple(), value: category.id - 1)
                                        
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding(.top, 10)
                        .background(Color.cardBackground)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .shadow(radius: 10)
                        
                    }
                    
                }
                
                
            }
            .background(Color.background)
        }
        .navigationBarTitle("")
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

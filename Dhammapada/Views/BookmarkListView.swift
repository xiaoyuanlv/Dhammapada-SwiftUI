//
//  BookmarkListView.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI
import SwiftUIPager

struct BookmarkListView: View {
    @EnvironmentObject var appDataManager : AppDataManager
    @StateObject var page: Page = .first()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        ZStack {
            
            VStack(alignment: .center) {
            
                HStack(spacing: 5) {
                
                Button {
                    appDataManager.selectedCategoryId = 0
                    appDataManager.dhammaList = []
                    appDataManager.favList = []
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedButton(text: "list.star", background: Color.button, textColor: .white)
                        .padding()
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text("Bookmarks")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }.frame(maxWidth: .infinity, alignment: .trailing)
               
                
            }
            .padding()
               
            if(appDataManager.favList.count > 0) {
                if(appDataManager.selectedLang == "en") {
                    Pager(page: page,
                          data: appDataManager.favList,
                          id: \.id,
                          content: { dhamma in
                                DhammaAtrrCard(dhamma: dhamma)
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "mm") {
                    Pager(page: page,
                          data: appDataManager.favList,
                          id: \.id,
                          content: { dhamma in
                                DhammaCard(dhamma: dhamma, language: "mm")
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "pali") {
                    Pager(page: page,
                          data: appDataManager.favList,
                          id: \.id,
                          content: { dhamma in
                                DhammaCard(dhamma: dhamma, language: "pali")
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "roman") {
                    Pager(page: page,
                          data: appDataManager.favList,
                          id: \.id,
                          content: { dhamma in
                                DhammaCard(dhamma: dhamma,  language: "roman")
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
            
            Spacer()
            
           
                 HStack(alignment: .center, spacing: 10) {
                    Button {
                        appDataManager.selectedLang = "en"
                        appDataManager.populateDhammaFavDataList()
                    } label: {
                       PrimaryButton(text: "EN")
                    }
                    
                    Button {
                        appDataManager.selectedLang = "mm"
                        appDataManager.populateDhammaFavDataList()
                    } label: {
                        PrimaryButton(text: "မြန်မာ")
                    }
                    
                    Button {
                        appDataManager.selectedLang = "pali"
                        appDataManager.populateDhammaFavDataList()
                    } label: {
                        PrimaryButton(text: "ပါဠိ")
                    }
                    
                    Button {
                        appDataManager.selectedLang = "roman"
                        appDataManager.populateDhammaFavDataList()
                    } label: {
                        PrimaryButton(text: "Pāḷi")
                    }
            }
            .padding(.bottom, 10)
                
                if(UIDevice.current.userInterfaceIdiom == .pad) {
                    VStack {
                        HStack(alignment: .center, spacing: 20) {
                            Button {
                                page.update(.previous)
                            } label: {
                                PrimaryButton(text: "Prev Page")
                            }
                            
                            Button {
                                page.update(.next)
                            } label: {
                                PrimaryButton(text: "Next Page")
                            }
                        }
                    }
                }
                
                } else {
                   
                        Text("No Bookmark Yet.")
                        .font(.title)
                        .foregroundColor(Color.text)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                }
            
                VStack {
                        Image("lake")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 70)
                }.background(Color.background)
               
                
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .background(Color.background)
        
        }.onAppear() {
            appDataManager.populateDhammaFavDataList()
        }
    }
}

struct BookmarkListView_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        Group {
            NavigationView {
                BookmarkListView()
            }
            NavigationView {
                BookmarkListView()
                    .preferredColorScheme(.dark)
            }
        }.environmentObject(appDataManager)
    }
}

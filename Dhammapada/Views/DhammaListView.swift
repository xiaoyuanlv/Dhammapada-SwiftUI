//
//  DhammaListView.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI
import SwiftUIPager

struct DhammaListView: View {
    
    @EnvironmentObject var appDataManager : AppDataManager
    var category: Category  = Category(id: 0, eng: "", mm: "", pali: "", roman: "", total: "")
    @StateObject var page: Page = .first()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        ZStack {
            
            VStack(alignment: .center) {
            
                HStack(spacing: 5) {
                
                Button {
                    appDataManager.selectedCategoryId = 0
                    appDataManager.dhammaList = []
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedButton(text: "list.star", background: Color.button, textColor: .white)
                        .padding()
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    switch appDataManager.selectedLang {
                        
                        case "en":  Text(category.eng)
                            .font(.title).bold()
                            .foregroundColor(.accentColor)
                        
                        case "mm":  Text(category.mm)
                            .font(.title).bold()
                            .foregroundColor(.accentColor)
                        
                        case "roman":  Text(category.roman)
                                .font(.title).bold()
                                .foregroundColor(.accentColor)
                       
                        case "pali":  Text(category.pali)
                                .font(.title).bold()
                                .foregroundColor(.accentColor)
                        
                        default:
                            Text(category.eng)
                               .font(.title).bold()
                               .foregroundColor(.accentColor)
                        
                    }
                   
                    Text("\(category.total)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                }.frame(maxWidth: .infinity, alignment: .trailing)
               
                
            }
            .padding()
            
                if(appDataManager.selectedLang == "en") {
                    Pager(page: page,
                          data: appDataManager.dhammaList,
                          id: \.id,
                          content: { dhamma in
                                DhammaAtrrCard(dhamma: dhamma)
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "mm") {
                    Pager(page: page,
                          data: appDataManager.dhammaList,
                          id: \.id,
                          content: { dhamma in
                                DhammaCard(dhamma: dhamma, language: "mm")
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "pali") {
                    Pager(page: page,
                          data: appDataManager.dhammaList,
                          id: \.id,
                          content: { dhamma in
                                DhammaCard(dhamma: dhamma, language: "pali")
                                    .environmentObject(appDataManager)
                    })
                    .interactive(scale: 0.8)
                }
                
                else if(appDataManager.selectedLang == "roman") {
                    Pager(page: page,
                          data: appDataManager.dhammaList,
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
                    appDataManager.populateDhammaDataList()
                  
                } label: {
                   PrimaryButton(text: "EN")
                }
                
                Button {
                    appDataManager.selectedLang = "mm"
                    appDataManager.populateDhammaDataList()
                  
                } label: {
                    PrimaryButton(text: "မြန်မာ")
                }
                
                Button {
                    appDataManager.selectedLang = "pali"
                    appDataManager.populateDhammaDataList()
                   
                } label: {
                    PrimaryButton(text: "ပါဠိ")
                }
                
                Button {
                    appDataManager.selectedLang = "roman"
                    appDataManager.populateDhammaDataList()
                  
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
            
            Image("lake")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 70)
               
              
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .background(Color.background)
        }.onAppear() {
            appDataManager.selectedCategoryId = category.id
            appDataManager.getDhammaList()
        }
    }
}

struct DhammaListView_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        Group {
            NavigationView {
                DhammaListView()
            }
            NavigationView {
                DhammaListView()
                    .preferredColorScheme(.dark)
            }
        }.environmentObject(appDataManager)
    }
}

//
//  DhammaAtrrCard.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/24/22.
//

import SwiftUI

struct DhammaAtrrCard: View {
    @State var dhamma: Dhamma
    @State var msgToShow: String = ""
    @EnvironmentObject var appDataManager : AppDataManager
  
  
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .topLeading) {
                
                ZStack(alignment: .center) {
                   
                    VStack(alignment: .center, spacing: 10) {
                        
                        ScrollView {
                            
                            VStack(alignment: .center) {
                                
                                if(msgToShow != "") {
                              
                                    if let data =  msgToShow.data(using: .unicode),
                                        let nsAttrString = try? NSAttributedString(data: data,
                                        options: [.documentType:NSAttributedString.DocumentType.html],
                                        documentAttributes: nil) {
                                        
                                        Text(AttributedString(nsAttrString))
                                            .lineSpacing(10)
                                            .font(.title)
                                            .foregroundColor(Color.text)
                                            .padding()
                                            .padding(.top, 20)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                       
                                         
                                    }
                                    
                                }
                                
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        
                        
                        
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.cardBackground)
                .shadow(radius: 10)
                .cornerRadius(20)
                .padding(10)
                
                Text("\(dhamma.id)")
                    .bold()
                    .shadow(radius: 5)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.text)
                    .background(Color.cardBackground)
                    .cornerRadius(20)
                    .padding()
                    
            }
            .padding()
            
            if(dhamma.fav == 1) {
                Button {
                    appDataManager.updateDhammaBookmark(id: dhamma.id, fav: 0)
                    dhamma.fav = 0
                } label: {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 30))
                        .shadow(radius: 5)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.text)
                        .background(Color.cardBackground)
                        .cornerRadius(20)
                        .padding()
                }
            } else {
                Button {
                    appDataManager.updateDhammaBookmark(id: dhamma.id, fav: 1)
                    dhamma.fav = 1
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 30))
                        .shadow(radius: 5)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.text)
                        .background(Color.cardBackground)
                        .cornerRadius(20)
                        .padding()
                }
            }
                
        }.onAppear() {
         
            if(UIDevice.current.userInterfaceIdiom == .phone) {
              
                msgToShow = "<p style='font-size: 2em; color:\(appDataManager.textColor)'; line-height: 2.2em;>"+dhamma.message+"</p>"
               
            } else if (UIDevice.current.userInterfaceIdiom == .pad) {
                
                msgToShow = "<p style='font-size: 3em;color:\(appDataManager.textColor)'; line-height: 22px;>"+dhamma.message+"</p>"
                
            }
           
        }
    }
}


struct DhammaAtrrCard_Previews: PreviewProvider {
    static let appDataManager : AppDataManager = {
        let appDataManager = AppDataManager()
        return appDataManager
    }()
    static var previews: some View {
        Group{
            DhammaAtrrCard(dhamma: Dhamma(id: 0, message: "", mm_message: "", pali_message: "", pali_roman: "", fav: 0, category_id: 0))
            DhammaAtrrCard(dhamma: Dhamma(id: 0, message: "", mm_message: "", pali_message: "", pali_roman: "", fav: 0, category_id: 0))
                .preferredColorScheme(.dark)
        }.environmentObject(appDataManager)
    }
}

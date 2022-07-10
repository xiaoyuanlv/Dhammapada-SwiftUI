//
//  DhammaCard.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

struct DhammaCard: View {
    @State var dhamma: Dhamma
    @State var msgToShow: String = ""
    @State var language: String = "en"
    @EnvironmentObject var appDataManager : AppDataManager
  
  
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .topLeading) {
                
                ZStack(alignment: .center) {
                   
                    VStack(alignment: .center, spacing: 5) {
                        
                        ScrollView {
                            
                            VStack(alignment: .center) {
                                
                                if(msgToShow != "") {
                              
                                   if(UIDevice.current.userInterfaceIdiom == .phone) {
                                     Text(msgToShow)
                                        .lineSpacing(17)
                                        .font(.system(size: 17))
                                        .foregroundColor(Color.text)
                                        .padding()
                                        .padding(.top, 20)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    } else if(UIDevice.current.userInterfaceIdiom == .pad) {
                                        Text(msgToShow)
                                           .lineSpacing(33)
                                           .font(.system(size: 33))
                                           .foregroundColor(Color.text)
                                           .padding()
                                           .padding(.top, 30)
                                           .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    } else {
                                        Text(msgToShow)
                                           .lineSpacing(21)
                                           .font(.system(size: 20))
                                           .foregroundColor(Color.text)
                                           .padding()
                                           .padding(.top, 22)
                                           .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    }
                                }
                                
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }.padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.cardBackground)
                .shadow(radius: 10)
                .cornerRadius(20)
                .padding(12)
                
                if(UIDevice.current.userInterfaceIdiom == .phone) {
                    Text("\(dhamma.id)")
                        .bold()
                        .shadow(radius: 5)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.text)
                        .background(Color.cardBackground)
                        .cornerRadius(20)
                        .padding()
                } else {
                    Text("\(dhamma.id)")
                        .bold()
                        .font(.system(size: 20))
                        .shadow(radius: 5)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.text)
                        .background(Color.cardBackground)
                        .cornerRadius(20)
                        .padding()
                }
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
         
            switch language {
                case "mm": msgToShow = dhamma.mm_message
                case "pali": msgToShow = dhamma.pali_message
                case "roman": msgToShow = dhamma.pali_roman
            default:msgToShow = dhamma.mm_message
            }
           
        }
    }
}

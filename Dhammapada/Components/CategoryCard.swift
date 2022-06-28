//
//  CategoryCard.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

struct CategoryCard: View {
    var category: Category
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            ZStack(alignment: .bottomTrailing) {
                
                ZStack(alignment: .bottom) {
                   
                    VStack(alignment: .center, spacing: 20) {
                        Text("\(category.eng)")
                            .font(.title2).bold()
                            .foregroundColor(.text)
                      
                        Text("\(category.mm)")
                            .foregroundColor(.text)
                        
                        Text("\(category.pali)")
                            .foregroundColor(.text)
                        
                        Text("\(category.roman)")
                            .foregroundColor(.text)
                        
                        Text("\(category.total)")
                            .fontWeight(.bold)
                            .foregroundColor(.text)
                    }
                    .padding()
                }
                .frame(width: 180, height: 270)
                .background(Color.card)
                .shadow(radius: 10)
                .cornerRadius(20)
                .padding(10)
               
                Image("flower")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 100)
                    .scaledToFit()
                
            }
            .padding()
            
            
            Text("\(category.id)")
                .bold()
                .shadow(radius: 5)
                .frame(width: 40, height: 40)
                .foregroundColor(.text)
                .background(Color.cardBackground)
                .cornerRadius(20)
                .padding()
                
        }
        
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CategoryCard(category: categoryDataList[0])
            CategoryCard(category: categoryDataList[0])
                .preferredColorScheme(.dark)
        }
    }
}

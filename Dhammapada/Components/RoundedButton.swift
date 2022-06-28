//
//  RoundedButton.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var background: Color
    var textColor: Color
    
    var body: some View {
        Image(systemName: text)
            .foregroundColor(textColor)
            .padding(17)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 5)
            .frame(width: 20, height: 20)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "arrow.forward", background: Color("AccentColor"), textColor: .black)
    }
}

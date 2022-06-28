//
//  Extension.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
            .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .scale.combined(with: .opacity)
            )
    }
}

extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.5)
    }
}

extension Text {
    func lotusTitle() -> some View {
        self.font(.title)
        .foregroundColor(.accentColor)
    }
}

extension Color {
    static let accentColor = Color("AccentColor")
    static let background = Color("Background")
    static let cardBackground = Color("CardBackground")
    static let card = Color("CardColor")
    static let text = Color("TextColor")
    static let button = Color("ButtonColor")
    static let tabBar = Color("TabBarBackground")
    static let systemBackground = Color(uiColor: .systemBackground)
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


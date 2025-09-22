//
//  BackgroundView.swift
//  DDAnimals
//
//  Created by joe on 9/21/25.
//

import SwiftUI

struct BackgroundView: View {
    let colorList: [Color] = [
        .pink,
        .yellow,
        .blue,
        .red
    ]
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colorList),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.7)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}

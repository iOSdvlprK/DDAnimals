//
//  AnimalImageView.swift
//  DDAnimals
//
//  Created by joe on 9/23/25.
//

import SwiftUI

struct AnimalImageView: View {
    var animalModel: AnimalModel
    
    let width = UIScreen.width
    let dim = 0.9 * UIScreen.width
    
    var body: some View {
        Image(animalModel.image.rawValue)
            .resizable()
            .frame(width: dim, height: dim)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(animalModel.color, lineWidth: 15)
            }
            .shadow(radius: 10)
            .frame(width: width, height: width)
    }
}

#Preview {
    AnimalImageView(
        animalModel: AnimalModel(
            image: .dog1,
            color: Color(red: 141/255, green: 203/255, blue: 216/255),
            name: [
                Language.english: ["Dog"],
                Language.spanish: ["Perro", "Perra"],
                Language.french: ["Chien", "Chienne"]
            ]
        )
    )
}

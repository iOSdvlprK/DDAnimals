//
//  AnimalView1.swift
//  DDAnimals
//
//  Created by joe on 9/21/25.
//

import SwiftUI

struct AnimalView1: View {
    @StateObject var animalViewModel: AnimalViewModel = .init()
    @StateObject var languageViewModel: LanguageViewModel = .init()
    
    @State private var currentLanguage: Language = .english
    @State private var currentImageIndex = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                // flags
                Text("Flags")
                    .padding()
                
                
                // animal image
                let currentAnimalModel: AnimalModel = animalViewModel.animalModels[currentImageIndex]
                
                AnimalImageView(animalModel: currentAnimalModel)
                    .onTapGesture {
                        let animalName = currentAnimalModel.getAnimalName(lang: currentLanguage)
                        
                        utter(text: animalName, language: currentLanguage)
                    }
                
                // arrow buttons
                HStack {
                    // left arrow
                    Image(systemName: "arrow.left.square")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .onTapGesture {
                            print("Left")
                        }
                    
                    Spacer()
                    
                    // right arrow
                    Image(systemName: "arrow.right.square")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .onTapGesture {
                            print("Right")
                        }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AnimalView1()
}

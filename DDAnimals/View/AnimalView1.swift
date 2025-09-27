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
                HStack {
                    ForEach(languageViewModel.languageModels) { languageModel in
                        let selected = currentLanguage == languageModel.language
                        
                        VStack(spacing: 0) {
                            let text = languageModel.language.rawValue
                            
                            Text(text)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            if let flag = languageModel.flag {
                                Image(flag.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding()
                        .opacity(selected ? 1 : 0.7)
                        .scaleEffect(selected ? 1.2 : 1)
                        .onTapGesture {
                            withAnimation {
                                currentLanguage = languageModel.language
                            }
                        }
                    }
                }
                  
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
                            // decrease currentImageIndex safely
                            currentImageIndex = currentImageIndex - 1
                            if currentImageIndex < 0 {
                                currentImageIndex = animalViewModel.animalModels.count - 1
                            }
                        }
                    
                    Spacer()
                    
                    // right arrow
                    Image(systemName: "arrow.right.square")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .onTapGesture {
                            print("Right")
                            currentImageIndex = currentImageIndex + 1
                            if currentImageIndex > animalViewModel.animalModels.count - 1 {
                                currentImageIndex = 0
                            }
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

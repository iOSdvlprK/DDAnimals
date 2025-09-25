//
//  LanguageViewModel.swift
//  DDAnimals
//
//  Created by joe on 9/25/25.
//

import Foundation

class LanguageViewModel: ObservableObject {
    @Published var languageModels: [LanguageModel] = []
    
    init() {
        languageModels.append(
            LanguageModel(language: .english, flag: .UnitedStates)
        )
        
        languageModels.append(
            LanguageModel(language: .spanish, flag: .Spain)
        )
        
        languageModels.append(
            LanguageModel(language: .french, flag: .France)
        )
    }
}

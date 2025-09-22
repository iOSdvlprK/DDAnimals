//
//  LanguageModel.swift
//  DDAnimals
//
//  Created by joe on 9/22/25.
//

import Foundation

struct LanguageModel: Identifiable {
    let id = UUID()
    let language: Language
    let flag: Flag?
}

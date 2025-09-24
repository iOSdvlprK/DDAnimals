//
//  Speech.swift
//  DDAnimals
//
//  Created by joe on 9/24/25.
//

import Foundation
import AVFoundation

func utter(text: String, language: Language) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: getLanguageCode(language: language))
    utterance.rate = 0.3
    let synth = AVSpeechSynthesizer()
    synth.speak(utterance)
}

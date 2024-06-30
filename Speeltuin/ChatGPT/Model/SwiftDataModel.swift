//
//  SwiftDataModel.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 30.06.24.
//
// If you make any changes to this file, you must either remove all saved data or uninstall the app from your device first.
// Failure to do so may result in the app crashing.
//
// Additionally, add `.modelContainer(for: SwiftDataModel.self)` in `SpeeltuinApp.swift`
//

import Foundation
import SwiftData

@Model
class SwiftDataModel

{
    @Attribute(.unique) var id: UUID = UUID()
    var dateAdded: Date
    var question: String
    var answer: String
  
    init(dateAdded: Date, question: String, answer: String) {
        self.dateAdded = dateAdded
        self.question = question
        self.answer = answer
    }
    
}

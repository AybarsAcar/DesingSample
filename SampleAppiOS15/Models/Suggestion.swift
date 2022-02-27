//
//  Suggestion.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 27/2/2022.
//

import SwiftUI

struct Suggestion: Identifiable {

  let id: UUID = .init()
  
  let text: String
}


var suggestions = [
  Suggestion(text: "SwiftUI"),
  Suggestion(text: "React"),
  Suggestion(text: "Design")
]

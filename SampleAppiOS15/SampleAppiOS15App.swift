//
//  SampleAppiOS15App.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 24/2/2022.
//

import SwiftUI

@main
struct SampleAppiOS15App: App {
  
  @StateObject private var model: Model
  
  init() {
    self._model = StateObject(wrappedValue: Model())
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(model)
    }
  }
}

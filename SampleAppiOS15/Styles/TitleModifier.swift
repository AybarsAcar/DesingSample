//
//  TitleModifier.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 11/3/2022.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.footnote.weight(.semibold))
      .foregroundColor(.secondary)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(20)
  }
}

extension View {
  var asTitle: some View {
    modifier(TitleModifier())
  }
}




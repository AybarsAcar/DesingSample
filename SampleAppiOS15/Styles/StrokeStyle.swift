//
//  StrokeStyle.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 24/2/2022.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  
  @Environment(\.colorScheme) private var colorScheme
  
  let cornerRadius: CGFloat
  
  func body(content: Content) -> some View {
    content
      .overlay(
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .stroke(.linearGradient(colors: [.white.opacity(colorScheme == .dark ? 0.1 : 0.3), .black.opacity(colorScheme == .dark ? 0.3 : 0.1)], startPoint: .top, endPoint: .bottom))
          .blendMode(.overlay)
      )
  }
}

extension View {
  
  func withStrokeStyle(cornerRadius: CGFloat = 30) -> some View {
    self.modifier(StrokeStyle(cornerRadius: cornerRadius))
  }
}

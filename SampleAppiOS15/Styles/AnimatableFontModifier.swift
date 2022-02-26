//
//  AnimatableFontModifier.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
  
  // size of the font
  var size: Double
  var weight: Font.Weight
  var design: Font.Design
  
  var animatableData: Double {
    get { size }
    set { size = newValue }
  }
  
  func body(content: Content) -> some View {
    content
      .font(.system(size: size, weight: weight, design: design))
  }
}


extension View {
  
  func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
    modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
  }
}

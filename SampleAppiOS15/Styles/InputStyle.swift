//
//  InputStyle.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 28/2/2022.
//

import SwiftUI

struct InputStyle: ViewModifier {
  
  var systemIcon: String
  
  func body(content: Content) -> some View {
    content
      .padding(15)
      .padding(.leading, 40)
      .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
      .withStrokeStyle(cornerRadius: 20)
      .overlay(
        Image(systemName: systemIcon)
          .foregroundColor(.secondary)
          .frame(width: 36, height: 36)
          .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(8)
      )
  }
}

extension View {
  
  func withInputStyle(systemIcon: String = "mail") -> some View {
    modifier(InputStyle(systemIcon: systemIcon))
  }
}

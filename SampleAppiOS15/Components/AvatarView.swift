//
//  AvatarView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 28/2/2022.
//

import SwiftUI

struct AvatarView: View {
  var body: some View {
    AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeInOut)) { phase in
      
      switch phase {
      case .success(let image):
        image
          .resizable()
          .transition(.scale(scale: 0.5, anchor: .center))
        
      case .empty:
        ProgressView()
        
      case .failure(_):
        Color.gray
        
      @unknown default:
        EmptyView()
      }
      
    }
    .frame(width: 26, height: 26)
    .cornerRadius(10)
    .padding(8)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    .withStrokeStyle(cornerRadius: 18)
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView()
  }
}

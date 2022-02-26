//
//  HexagonView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 25/2/2022.
//

import SwiftUI

struct HexagonView: View {
  
  let colors: [Color]
  
  init(colors: [Color] = [.pink, .blue]) {
    self.colors = colors
  }
  
  var body: some View {
    
    Canvas { context, size in
      
      context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
      
      context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
    .frame(width: 200, height: 212, alignment: .center)
    .foregroundStyle(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
  }
}

struct HexagonView_Previews: PreviewProvider {
  static var previews: some View {
    HexagonView()
  }
}

//
//  HexagonView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 25/2/2022.
//

import SwiftUI

struct HexagonView: View {
  var body: some View {
    
    Canvas { context, size in
      
      context.draw(Text("AybarsAcar").font(.largeTitle), at: CGPoint(x: 50, y: 20))
      
      context.fill(Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)), with: .color(.pink))
      
      context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
      
      context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
    .frame(width: 200, height: 212, alignment: .center)
    .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
  }
}

struct HexagonView_Previews: PreviewProvider {
  static var previews: some View {
    HexagonView()
  }
}

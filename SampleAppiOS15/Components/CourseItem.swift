//
//  CourseItem.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct CourseItem: View {
  // animation variables
  var namespace: Namespace.ID
  @Binding var show: Bool
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(alignment: .leading, spacing: 12) {
        Text("SwiftUI")
          .font(.largeTitle.weight(.bold))
          .matchedGeometryEffect(id: AnimationID.titleID, in: namespace)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Text("20 sections - 3 hours".uppercased())
          .font(.footnote.weight(.semibold))
          .matchedGeometryEffect(id: AnimationID.subtitleID, in: namespace)
        
        Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
          .font(.footnote)
          .matchedGeometryEffect(id: AnimationID.textID, in: namespace)
      }
      .padding(20)
      .background(
        Rectangle()
          .fill(.ultraThinMaterial)
          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .blur(radius: 30)
          .matchedGeometryEffect(id: AnimationID.blurID, in: namespace)
      )
      
    }
    .foregroundStyle(.white)
    .background(
      Image("Illustration 9")
        .resizable()
        .scaledToFit()
        .matchedGeometryEffect(id: AnimationID.imageID, in: namespace)
    )
    .background(
      Image("Background 5")
        .resizable()
        .scaledToFill()
        .matchedGeometryEffect(id: AnimationID.backgroundID, in: namespace)
    )
    .mask(
      RoundedRectangle(cornerRadius: 30, style: .continuous)
        .matchedGeometryEffect(id: AnimationID.maskID, in: namespace)
    )
    .frame(height: 300)
    .padding(20)
  }
}

struct CourseItem_Previews: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    CourseItem(namespace: namespace, show: .constant(false))
  }
}

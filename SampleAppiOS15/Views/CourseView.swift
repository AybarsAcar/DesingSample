//
//  CourseView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct CourseView: View {
  
  // animation variables
  let namespace: Namespace.ID
  @Binding var show: Bool
  
  
  var body: some View {
    
    ZStack {
      ScrollView {
        cover
      }
      .background(Color.background)
      
      Button {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
          show.toggle()
        }
      } label: {
        Image(systemName: "xmark")
          .font(.body.weight(.bold))
          .foregroundColor(.secondary)
          .padding(8)
          .background(.ultraThinMaterial, in: Circle())
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
      .padding(20)
      
    }
    .statusBar(hidden: true)
    .ignoresSafeArea()
  }
}

extension CourseView {
  
  private var cover: some View {
    VStack {
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .frame(height: 500)
    .foregroundStyle(.black)
    .background(
      Image("Illustration 9")
        .resizable()
        .scaledToFit()
        .matchedGeometryEffect(id: AnimationID.imageID, in: namespace)
    )
    .padding(20)
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
    .overlay(
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
        
        Divider()
        
        HStack {
          Image("Avatar Default")
            .resizable()
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .withStrokeStyle(cornerRadius: 18)
          
          Text("Taught by Aybars Acar")
            .font(.footnote)
        }
      }
        .padding(20)
        .background(
          Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .matchedGeometryEffect(id: AnimationID.blurID, in: namespace)
        )
        .offset(x: 0, y: 250)
        .padding(20)
      
    )
  }
}

struct CourseView_Previews: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    CourseView(namespace: namespace, show: .constant(true))
  }
}

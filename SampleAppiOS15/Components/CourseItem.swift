//
//  CourseItem.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct CourseItem: View {
  
  let course: Course
  
  // animation variables
  var namespace: Namespace.ID
  @Binding var show: Bool
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(alignment: .leading, spacing: 12) {
        Text(course.title)
          .font(.largeTitle.weight(.bold))
          .matchedGeometryEffect(id: AnimationID.titleID(for: course.id.uuidString), in: namespace)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Text(course.subtitle.uppercased())
          .font(.footnote.weight(.semibold))
          .matchedGeometryEffect(id: AnimationID.subtitleID(for: course.id.uuidString), in: namespace)
        
        Text(course.text)
          .font(.footnote)
          .matchedGeometryEffect(id: AnimationID.textID(for: course.id.uuidString), in: namespace)
      }
      .padding(20)
      .background(
        Rectangle()
          .fill(.ultraThinMaterial)
          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .blur(radius: 30)
          .matchedGeometryEffect(id: AnimationID.blurID(for: course.id.uuidString), in: namespace)
      )
      
    }
    .foregroundStyle(.white)
    .background(
      Image(course.image)
        .resizable()
        .scaledToFit()
        .matchedGeometryEffect(id: AnimationID.imageID(for: course.id.uuidString), in: namespace)
    )
    .background(
      Image(course.background)
        .resizable()
        .scaledToFill()
        .matchedGeometryEffect(id: AnimationID.backgroundID(for: course.id.uuidString), in: namespace)
    )
    .mask(
      RoundedRectangle(cornerRadius: 30, style: .continuous)
        .matchedGeometryEffect(id: AnimationID.maskID(for: course.id.uuidString), in: namespace)
    )
    .frame(height: 300)
    .padding(20)
  }
}

struct CourseItem_Previews: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    Group {
      CourseItem(course: courses[0], namespace: namespace, show: .constant(false))
      CourseItem(course: courses[2], namespace: namespace, show: .constant(false))
        .preferredColorScheme(.dark)
    }
    .previewLayout(.sizeThatFits)
  }
}

//
//  FeaturedItem.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct FeaturedItem: View {
  
  @Environment(\.sizeCategory) private var sizeCategory
  
  let course: Course
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      Spacer()
      
      Image(course.logo)
        .resizable()
        .scaledToFit()
        .frame(width: 26, height: 26)
        .cornerRadius(10)
        .padding(9)
        .background(Color(uiColor: UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .withStrokeStyle(cornerRadius: 16)
      
      Text(course.title)
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .dynamicTypeSize(.large)
      
      Text(course.subtitle.uppercased())
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
      
      Text(course.text)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(sizeCategory > .large ? 1 : 2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.secondary)
    }
    .padding(20)
    .padding(.vertical, 20)
    .frame(height: 350)
    .background(.ultraThinMaterial)
    .mask {
      RoundedRectangle(cornerRadius: 30, style: .continuous)
    }
    .withStrokeStyle()
    .padding(.horizontal, 20)
  }
}

struct FeaturedItem_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      FeaturedItem(course: courses[0])
      FeaturedItem(course: courses[1])
        .preferredColorScheme(.dark)
    }
    .background(Image("Blob 1").offset(x: 250, y: -100))
    .previewLayout(.sizeThatFits)
    .shadow(color: .shadow.opacity(0.3), radius: 10, x: 0, y: 10)
    .padding(.vertical, 40)
  }
}

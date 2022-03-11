//
//  ExploreView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 11/3/2022.
//

import SwiftUI

struct ExploreView: View {
  var body: some View {
    ZStack {
      Color.background
        .ignoresSafeArea()
      
      ScrollView {
        coursesSection
        
        Text("Topics".uppercased())
          .asTitle
        
        topicsSection
        
        Text("Popular".uppercased())
          .asTitle
        
        handbooksSection
      }
    }
    .safeAreaInset(edge: .top) {
      Color.clear.frame(height: 70)
    }
    .overlay(
      NavigationBar(title: "Recent", hasScrolled: .constant(true))
    )
    .background(
      Image("Blob 1").offset(x: -100, y: -400)
    )
  }
}


// MARK: - Components
extension ExploreView {
  
  var coursesSection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 16) {
        ForEach(courses) { item in
          SmallCourseItem(course: item)
        }
      }
      .padding(.horizontal, 20)
      
      Spacer()
    }
  }
  
  var handbooksSection: some View {
    HStack(alignment: .top, spacing: 16) {
      ForEach(handbooks) { item in
        HandbookItem(handbook: item)
      }
    }
    .padding(.horizontal, 20)
  }
  
  var topicsSection: some View {
    VStack {
      ForEach(topics) { item in
        ListRow(topic: item)
      }
    }
    .padding(20)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .withStrokeStyle()
    .padding(.horizontal, 20)
  }
}


struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreView()
  }
}

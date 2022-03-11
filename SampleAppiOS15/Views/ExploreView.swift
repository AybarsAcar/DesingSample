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
      
      coursesSection
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
}


struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreView()
  }
}

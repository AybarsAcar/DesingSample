//
//  LibraryView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 14/3/2022.
//

import SwiftUI

struct LibraryView: View {
  var body: some View {
    ZStack {
      Color.background
        .ignoresSafeArea()
      
      ScrollView(.vertical, showsIndicators: false) {
        
        
        CertificateView()
          .frame(height: 220)
          .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
              .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
              .padding(20)
              .offset(y: -30)
          )
          .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
              .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
              .padding(40)
              .offset(y: -60)
          )
          .padding(20)
        
        
        Text("History".uppercased())
          .asTitle
        
        
        coursesSection
        
        Text("Topics".uppercased())
          .asTitle
        
        topicsSection
    
      }
    }
    .safeAreaInset(edge: .top) {
      Color.clear.frame(height: 70)
    }
    .overlay(
      NavigationBar(title: "Library", hasScrolled: .constant(true))
    )
    .background(
      Image("Blob 1").offset(x: -100, y: -400)
    )
  }
}


// MARK: - Components
extension LibraryView {
  
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


struct LibraryView_Previews: PreviewProvider {
  static var previews: some View {
    LibraryView()
  }
}

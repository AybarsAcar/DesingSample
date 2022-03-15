//
//  NotificationsView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 14/3/2022.
//

import SwiftUI

struct NotificationsView: View {
  var body: some View {
    ZStack {
      Color.background.ignoresSafeArea()
      
      ScrollView {
        sectionsSection
      }
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })
      .overlay {
        NavigationBar(title: "Notifications", hasScrolled: .constant(true))
      }
      .background {
        Image("Blob 1").offset(x: -180, y: 300)
      }
    }
  }
}

// MARK: - Components
extension NotificationsView {
  private var sectionsSection: some View {
    VStack(alignment: .leading) {
      ForEach(Array(courseSections.enumerated()), id: \.offset) { i, section in
        
        if i != 0 {
          Divider()
        }
        
        SectionRow(section: section)
      }
    }
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30 , style: .continuous))
    .withStrokeStyle(cornerRadius: 30)
    .padding(20)
  }
}

struct NotificationsView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationsView()
  }
}

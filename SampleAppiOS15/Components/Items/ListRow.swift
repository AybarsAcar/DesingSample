//
//  ListRow.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 11/3/2022.
//

import SwiftUI

struct ListRow: View {
  
  let topic: Topic
  
  var body: some View {
    HStack {
      Image(systemName: topic.icon)
        .frame(width: 36, height: 36)
        .background(.ultraThinMaterial)
        .mask(Circle())
      
      Text(topic.title)
        .fontWeight(.semibold)
      
      Spacer()
    }
  }
}

struct ListRow_Previews: PreviewProvider {
  static var previews: some View {
    ListRow(topic: topics[0])
  }
}

//
//  SearchView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 27/2/2022.
//

import SwiftUI

struct SearchView: View {
  
  @Environment(\.presentationMode) private var presentationMode
  
  @State private var text: String = ""
  
  var body: some View {
    NavigationView {
      
      ScrollView {
        VStack {
          searchContent
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .withStrokeStyle(cornerRadius: 30)
        .padding(20)
        .background(
          Rectangle()
            .fill(.regularMaterial)
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .top)
            .blur(radius: 20)
            .offset(y: -200)
        )
        .background(
          Image("Blob 1")
            .offset(x: -100, y: -200)
        )
      }
      .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design")) {
        ForEach(suggestions) { suggestion in
          Button {
            self.text = suggestion.text
          } label: {
            Text(suggestion.text)
              .searchCompletion(suggestion.text)
          }

        }
      }
      .navigationTitle("Search")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Done") {
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      
    }
  }
}

extension SearchView {
  
  private var searchContent: some View {
    ForEach(courses.filter({ $0.title.contains(text) || text.isEmpty })) { item in
      HStack(alignment: .top, spacing: 4) {
        
        Image(item.image)
          .resizable()
          .scaledToFill()
          .frame(width: 44, height: 44)
          .background(Color.background)
          .mask(Circle())
        
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
              .bold()
          
          Text(item.text)
            .font(.footnote)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
      }
      .padding(.vertical, 4)
      .listRowSeparator(.hidden)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

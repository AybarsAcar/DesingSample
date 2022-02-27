//
//  NavigationBar.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import SwiftUI

struct NavigationBar: View {
  
  var title: String = ""
  @Binding var hasScrolled: Bool
  
  @State private var showSearch: Bool = false
  @State private var showAccount: Bool = false

  var body: some View {
    ZStack {
      // background layer
      Color.clear
        .background(.ultraThinMaterial)
        .blur(radius: 10)
        .opacity(hasScrolled ? 1 : 0)
      
      // content layer
      Text(title)
        .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.top, 20)
        .offset(y: hasScrolled ? -4 : 0)
      
      HStack(spacing: 16) {
        
        Button {
          showSearch.toggle()
        } label: {
          Image(systemName: "magnifyingglass")
            .font(.body.weight(.bold))
            .frame(width: 36, height: 36)
            .foregroundColor(.secondary)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .withStrokeStyle(cornerRadius: 14)
        }
        .sheet(isPresented: $showSearch) {
          showSearch = false
        } content: {
          SearchView()
        }

        Button {
          showAccount.toggle()
        } label: {
          Image("Avatar Default")
            .resizable()
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .withStrokeStyle(cornerRadius: 18)
        }
        .sheet(isPresented: $showAccount) {
          showAccount = false
        } content: {
          AccountView()
        }

      }
      .frame(maxWidth: .infinity, alignment: .trailing)
      .padding(.trailing, 20)
      .padding(.top, 20)
      .offset(y: hasScrolled ? -4 : 0)
    }
    .frame(height: hasScrolled ? 44 : 70)
    .frame(maxHeight: .infinity, alignment: .top)
  }
}

struct NavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBar(title: "Featured", hasScrolled: .constant(false))
  }
}

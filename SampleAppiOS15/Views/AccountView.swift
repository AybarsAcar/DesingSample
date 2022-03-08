//
//  AccountView.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 24/2/2022.
//

import SwiftUI

struct AccountView: View {

  @Environment(\.dismiss) private var dismiss
  @AppStorage("isLogged") private var isLogged: Bool = false

  @State private var isDeleted: Bool = false
  @State private var isPinned: Bool = false
  
  var body: some View {
    NavigationView {
      List {
        
        profileHeaderSection
        
        menuSection
        
        linkSection
        
        Button {
          isLogged = false
          dismiss()
        } label: {
          Text("Sign out")
        }
        .tint(.red)

      }
      .listStyle(.insetGrouped)
      .navigationTitle("Account")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Text("Done")
          }

        }
      }
    }
  }
}

extension AccountView {
  
  private var profileHeaderSection: some View {
    VStack(spacing: 8) {
      Image(systemName: "person.crop.circle.fill.badge.checkmark")
        .font(.system(size: 32))
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .blue.opacity(0.4))
        .padding()
        .background(Circle().fill(.ultraThinMaterial))
        .background(
          HexagonView(colors: [.teal, .pink])
            .offset(x: -50, y: -100)
        )
        .background(
          BlobView()
            .offset(x: 200, y: 0)
            .scaleEffect(0.6)
        )
      
      Text("Aybars Acar")
        .font(.title)
        .fontWeight(.semibold)
      
      HStack {
        Image(systemName: "location")
          .imageScale(.small)
          .foregroundColor(.secondary)
        
        Text("Australia")
          .foregroundColor(.secondary)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
  }
  
  private var menuSection: some View {
    Section {
      NavigationLink(destination: Text("Hello Settings")) {
        Label("Settings", systemImage: "gear")
      }
      
      NavigationLink {
        Text("Hello Billing")
      } label: {
        Label("Billing", systemImage: "creditcard")
      }
      
      NavigationLink {
        Text("Hello Help")
      } label: {
        Label("Help", systemImage: "questionmark")
      }
      
    }
    .accentColor(.primary)
    .listRowSeparator(.hidden)
  }
  
  private var linkSection: some View {
    Section {
      if !isDeleted {
        Link(destination: URL(string: "https://apple.com")!) {
          HStack {
            Label("Website", systemImage: "house")
            Spacer()
            Image(systemName: "link")
              .foregroundColor(.secondary)
          }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
          Button(action: {
            isDeleted = true
          }) {
            Label("Delete", systemImage: "trash")
          }
          .tint(.red)
          
          pinButton
          
        }
      }
      
      Link(destination: URL(string: "https://youtube.com")!) {
        HStack {
          Label("YouTube", systemImage: "tv")
          Spacer()
          Image(systemName: "link")
            .foregroundColor(.secondary)
        }
      }
      .swipeActions {
        pinButton
      }
    }
    .accentColor(.primary)
    .listRowSeparator(.hidden)
  }
  
  private var pinButton: some View {
    Button {
      isPinned.toggle()
    } label: {
      
      if !isPinned {
        Label("Pin", systemImage: "pin")
      }
      else {
        Label("Unpin", systemImage: "pin.slash")
      }
    }
    .tint(isPinned ? .gray : .yellow)
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}

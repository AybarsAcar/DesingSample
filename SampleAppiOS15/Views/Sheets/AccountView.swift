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
  @AppStorage("isLiteMode") private var isLiteMode = true

  @ObservedObject private var coinModel = CoinModel()
  
  @State private var isDeleted: Bool = false
  @State private var isPinned: Bool = false
  @State private var address: Address?
  
  var body: some View {
    NavigationView {
      List {
        
        profileHeaderSection
        
        menuSection
        
        Section {
          Toggle(isOn: $isLiteMode) {
            Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
          }
        }
        .accentColor(.primary)
        
        linkSection
        
        coinSection
        
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
      .task {
        await fetchAddress()
        await coinModel.fetchCoins()
      }
      .refreshable {
        await fetchAddress()
        await coinModel.fetchCoins()
      }
    }
  }
}

// MARK: - Components
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
        
        if let address = address {
          Text(address.country)
        }
        else {
          Text("Australia")
            .foregroundColor(.secondary)
        }
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
  
  private var coinSection: some View {
    
    Section(header: Text("Coins")) {
      ForEach(coinModel.coins) { coin in
        HStack {
          AsyncImage(url: URL(string: coin.logo)) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 32, height: 32)
          } placeholder: {
            ProgressView()
          }
          
          VStack(alignment: .leading, spacing: 4) {
            Text(coin.coinName)
            Text(coin.acronym)
              .font(.caption)
              .foregroundColor(.secondary)
          }
        }
      }
    }
  }
}

// MARK: - functions
extension AccountView {
  
  // fetches a random address
  func fetchAddress() async {
    let url = URL(string: "https://random-data-api.com/api/address/random_address")!
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      address = try JSONDecoder().decode(Address.self, from: data)
    } catch {
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}

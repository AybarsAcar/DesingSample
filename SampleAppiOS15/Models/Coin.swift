//
//  Coin.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 9/3/2022.
//

import Foundation

struct Coin: Identifiable, Codable {
  let id: Int
  let uid, coinName, acronym: String
  let logo: String
  
  enum CodingKeys: String, CodingKey {
    case id, uid
    case coinName = "coin_name"
    case acronym, logo
  }
}

final class CoinModel: ObservableObject {
  @Published var coins = [Coin]()
  
  @MainActor
  func fetchCoins() async {
    guard let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") else { return }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      
      coins = try JSONDecoder().decode([Coin].self, from: data)
    } catch {
      print(error)
    }
  }
}

//
//  Address.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 8/3/2022.
//

import Foundation

struct Address: Identifiable, Codable {
  let id: Int
  let uid, city, streetName, streetAddress: String
  let secondaryAddress, buildingNumber, mailBox, community: String
  let zipCode, zip, postcode, timeZone: String
  let streetSuffix, citySuffix, cityPrefix, state: String
  let stateAbbr, country, countryCode: String
  let latitude, longitude: Double
  let fullAddress: String
  
  enum CodingKeys: String, CodingKey {
    case id, uid, city
    case streetName = "street_name"
    case streetAddress = "street_address"
    case secondaryAddress = "secondary_address"
    case buildingNumber = "building_number"
    case mailBox = "mail_box"
    case community
    case zipCode = "zip_code"
    case zip, postcode
    case timeZone = "time_zone"
    case streetSuffix = "street_suffix"
    case citySuffix = "city_suffix"
    case cityPrefix = "city_prefix"
    case state
    case stateAbbr = "state_abbr"
    case country
    case countryCode = "country_code"
    case latitude, longitude
    case fullAddress = "full_address"
  }
}

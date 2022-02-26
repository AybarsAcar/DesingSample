//
//  AnimationIDs.swift
//  SampleAppiOS15
//
//  Created by Aybars Acar on 26/2/2022.
//

import Foundation

struct AnimationID {
  private init() { }
  
  static func titleID(for id: String) -> String { return "title_id\(id)" }
  static func subtitleID(for id: String) -> String { return "subtitle_id\(id)" }
  static func backgroundID(for id: String) -> String { return "background_id\(id)" }
  static func textID(for id: String) -> String { return "text_id\(id)" }
  static func maskID(for id: String) -> String { return "mask_id\(id)" }
  static func imageID(for id: String) -> String { return "image_id\(id)" }
  static func blurID(for id: String) -> String { return "blur_id\(id)" }
}

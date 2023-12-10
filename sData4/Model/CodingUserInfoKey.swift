//
//  CodingUserInfoKey.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//

import Foundation

// See: https://stackoverflow.com/a/52698618
// See: https://www.donnywals.com/using-codable-with-core-data-and-nsmanagedobject/
// Required to decode straight from JSON into Core Data managed objects

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")!
}

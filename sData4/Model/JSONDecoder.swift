//
//  JSONDecoder.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//

import CoreData
import Foundation

// Allow for decoding directly into Core Data objects
extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.context] = context
    }
}

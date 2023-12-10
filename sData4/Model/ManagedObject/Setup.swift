//
//  Setup.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//

import CoreData
import Foundation

@objc(Setup)
public class Setup: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case seed_id, row, col, block_id, updated_at
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seedId = try container.decode(Int32.self, forKey: .seed_id)
        self.row = try container.decode(Int32.self, forKey: .row)
        self.col = try container.decode(Int32.self, forKey: .col)
        self.blockId = try container.decode(Int32.self, forKey: .block_id)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }
    
    public func encode(to encoder: Encoder) throws {
      print("In Setup encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(seedId, forKey: .seed_id)
        try container.encode(row, forKey: .row)
        try container.encode(col, forKey: .col)
        try container.encode(blockId, forKey: .block_id)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Setup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Setup> {
        return NSFetchRequest<Setup>(entityName: "Setup")
    }

    @NSManaged public var seedId: Int32
    @NSManaged public var row: Int32
    @NSManaged public var col: Int32
    @NSManaged public var blockId: Int32
    @NSManaged public var updatedAt: Date

}

extension Setup : Identifiable {
    
}

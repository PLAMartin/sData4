//
//  Spawn.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//
// seed_id, block_id, probability, updated_at

import CoreData
import Foundation

@objc(Spawn)
public class Spawn: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case seed_id, block_id, probability, updated_at
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seedId = try container.decode(Int32.self, forKey: .seed_id)
        self.blockId = try container.decode(Int32.self, forKey: .block_id)
        self.probability = try container.decode(Int32.self, forKey: .probability)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }
    
    public func encode(to encoder: Encoder) throws {
      print("In Spawn encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(seedId, forKey: .seed_id)
        try container.encode(blockId, forKey: .block_id)
        try container.encode(probability, forKey: .probability)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Spawn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spawn> {
        return NSFetchRequest<Spawn>(entityName: "Spawn")
    }

    @NSManaged public var seedId: Int32
    @NSManaged public var blockId: Int32
    @NSManaged public var probability: Int32
    @NSManaged public var updatedAt: Date

}

extension Spawn : Identifiable {
    
}

//
//  Target.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Target)
public class Target: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case seed_id, block_id, target, display_order, updated_at
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
        self.target = try container.decode(Int32.self, forKey: .target)
        self.displayOrder = try container.decode(Int32.self, forKey: .display_order)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }

}

extension Target {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Target> {
        return NSFetchRequest<Target>(entityName: "Target")
    }

    @NSManaged public var seedId: Int32
    @NSManaged public var blockId: Int32
    @NSManaged public var target: Int32
    @NSManaged public var displayOrder: Int32
    @NSManaged public var updatedAt: Date

}

extension Target : Identifiable {
    
}

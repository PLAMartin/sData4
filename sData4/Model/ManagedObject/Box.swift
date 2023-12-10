//
//  Box.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Box)
public class Box: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case series_id, episode_id, variant_id, grid_id, updated_at
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seriesId = try container.decode(Int32.self, forKey: .series_id)
        self.episodeId = try container.decode(Int32.self, forKey: .episode_id)
        self.variantId = try container.decode(Int32.self, forKey: .variant_id)
        self.gridId = try container.decode(Int32.self, forKey: .grid_id)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }

}

extension Box {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Box> {
        return NSFetchRequest<Box>(entityName: "Box")
    }

    @NSManaged public var seriesId: Int32
    @NSManaged public var episodeId: Int32
    @NSManaged public var variantId: Int32
    @NSManaged public var gridId: Int32
    @NSManaged public var updatedAt: Date

}

extension Box : Identifiable {
    
}

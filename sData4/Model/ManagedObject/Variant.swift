//
//  Variant.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//

import CoreData
import Foundation

@objc(Variant)
public class Variant: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case variant_id, name, secs_per_life, display_order, updated_at, boxes
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.variantId = try container.decode(Int32.self, forKey: .variant_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.secsPerLife = try container.decode(Int32.self, forKey: .secs_per_life)
        self.displayOrder = try container.decode(Int32.self, forKey: .display_order)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
        let boxes = try container.decode(Set<PalettePart>.self, forKey: .boxes)
        self.boxes = boxes as NSSet
        
    }

}

extension Variant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variant> {
        return NSFetchRequest<Variant>(entityName: "Variant")
    }

    @NSManaged public var variantId: Int32
    @NSManaged public var name: String
    @NSManaged public var secsPerLife: Int32
    @NSManaged public var displayOrder: Int32
    @NSManaged public var updatedAt: Date
    @NSManaged public var boxes: NSSet?
    
    public var boxArray: [Box] {
        let set = boxes as? Set<Box> ?? []
        return set.sorted {
            $0.seriesId < $1.seriesId
        }
    }

}

extension Variant : Identifiable {
    
}

// MARK: Generated accessors for boxes
extension Variant {

    @objc(addBoxesObject:)
    @NSManaged public func addToBoxes(_ value: Box)

    @objc(removeBoxesObject:)
    @NSManaged public func removeFromBoxes(_ value: Box)

    @objc(addBoxes:)
    @NSManaged public func addToBoxes(_ values: NSSet)

    @objc(removeBoxes:)
    @NSManaged public func removeFromBoxes(_ values: NSSet)

}

//
//  Part.swift
//  sData4
//
//  Created by Philip Martin on 15/08/2023.
//

import CoreData
import Foundation

@objc(Part)
public class Part: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case part_id, name, application, alpha, updated_at, palette_parts, block_fill_parts, block_stroke_parts, block_inner_parts
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.partId = try container.decode(Int32.self, forKey: .part_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.application = try container.decode(String.self, forKey: .application)
        self.alpha = try container.decode(Float.self, forKey: .alpha)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        let paletteParts = try container.decode(Set<PalettePart>.self, forKey: .palette_parts) as NSSet
        addToPaletteParts(paletteParts)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        print("In Part encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(partId, forKey: .part_id)
        try container.encode(name, forKey: .name)
        try container.encode(application, forKey: .application)
        try container.encode(alpha, forKey: .alpha)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Part {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Part> {
        return NSFetchRequest<Part>(entityName: "Part")
    }

    @NSManaged public var partId: Int32
    @NSManaged public var name: String
    @NSManaged public var application: String
    @NSManaged public var alpha: Float
    @NSManaged public var updatedAt: Date
    
    @NSManaged public var blockFillParts: NSSet?
    @NSManaged public var blockInnerParts: NSSet?
    @NSManaged public var blockStrokeParts: NSSet?
    @NSManaged public var paletteParts: NSSet?
    
    public var blockFillPartsArray: [Block] {
        let set = blockFillParts as? Set<Block> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
        }
    }
    
    public var blockInnerPartsArray: [Block] {
        let set = blockInnerParts as? Set<Block> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
        }
    }
    
    public var blockStrokePartsArray: [Block] {
        let set = blockStrokeParts as? Set<Block> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
        }
    }
    
    public var palettePartsArray: [PalettePart] {
        let set = paletteParts as? Set<PalettePart> ?? []
        return set.sorted {
            $0.partId < $1.partId
        }
    }

}

extension Part : Identifiable {

}

// MARK: Generated accessors for blockFillParts
extension Part {

    @objc(addBlockFillPartsObject:)
    @NSManaged public func addToBlockFillParts(_ value: Block)

    @objc(removeBlockFillPartsObject:)
    @NSManaged public func removeFromBlockFillParts(_ value: Block)

    @objc(addBlockFillParts:)
    @NSManaged public func addToBlockFillParts(_ values: NSSet)

    @objc(removeBlockFillParts:)
    @NSManaged public func removeFromBlockFillParts(_ values: NSSet)

}

// MARK: Generated accessors for blockInnerParts
extension Part {

    @objc(addBlockInnerPartsObject:)
    @NSManaged public func addToBlockInnerParts(_ value: Block)

    @objc(removeBlockInnerPartsObject:)
    @NSManaged public func removeFromBlockInnerParts(_ value: Block)

    @objc(addBlockInnerParts:)
    @NSManaged public func addToBlockInnerParts(_ values: NSSet)

    @objc(removeBlockInnerParts:)
    @NSManaged public func removeFromBlockInnerParts(_ values: NSSet)

}

// MARK: Generated accessors for blockStrokeParts
extension Part {

    @objc(addBlockStrokePartsObject:)
    @NSManaged public func addToBlockStrokeParts(_ value: Block)

    @objc(removeBlockStrokePartsObject:)
    @NSManaged public func removeFromBlockStrokeParts(_ value: Block)

    @objc(addBlockStrokeParts:)
    @NSManaged public func addToBlockStrokeParts(_ values: NSSet)

    @objc(removeBlockStrokeParts:)
    @NSManaged public func removeFromBlockStrokeParts(_ values: NSSet)

}

// MARK: Generated accessors for paletteParts
extension Part {

    @objc(addPalettePartsObject:)
    @NSManaged public func addToPaletteParts(_ value: PalettePart)

    @objc(removePalettePartsObject:)
    @NSManaged public func removeFromPaletteParts(_ value: PalettePart)

    @objc(addPaletteParts:)
    @NSManaged public func addToPaletteParts(_ values: NSSet)

    @objc(removePaletteParts:)
    @NSManaged public func removeFromPaletteParts(_ values: NSSet)

}

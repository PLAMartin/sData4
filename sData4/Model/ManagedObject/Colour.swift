//
//  Colour.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//
// https://blog.logrocket.com/simplify-json-parsing-swift-using-codable/
// https://matteomanferdini.com/codable/#section4
// https://www.donnywals.com/using-codable-with-core-data-and-nsmanagedobject/

import CoreData
import Foundation

@objc(Colour)
public class Colour: NSManagedObject, Codable {
    
    // What properties to code and decode
    enum CodingKeys: CodingKey {
        case colour_id, name, red, green, blue, alpha, note, updated_at, palette_parts
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.colourId = try container.decode(Int32.self, forKey: .colour_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.red = try container.decode(Int32.self, forKey: .red)
        self.green = try container.decode(Int32.self, forKey: .green)
        self.blue = try container.decode(Int32.self, forKey: .blue)
        self.alpha = try container.decode(Float.self, forKey: .alpha)
        self.note = try container.decode(String.self, forKey: .note)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
        //let paletteParts = try container.decodeIfPresent(Set<PalettePart>.self, forKey: .palette_parts) as? NSSet
        //addToPaletteParts(paletteParts ?? [])
        /*
        for palettePart in paletteParts ?? [] {
            print("palettePart: \(palettePart)")
        }
         */
        
    }
    
    public func encode(to encoder: Encoder) throws {
      print("In Colour encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(colourId, forKey: .colour_id)
        try container.encode(name, forKey: .name)
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(alpha, forKey: .alpha)
        try container.encode(note, forKey: .note)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Colour {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Colour> {
        return NSFetchRequest<Colour>(entityName: "Colour")
    }

    @NSManaged public var alpha: Float
    @NSManaged public var blue: Int32
    @NSManaged public var colourId: Int32
    @NSManaged public var green: Int32
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var red: Int32
    @NSManaged public var updatedAt: Date
    @NSManaged public var paletteParts: NSSet? // Set<PalettePart>
    
    public var palettePartArray: [PalettePart] {
        let set = paletteParts as? Set<PalettePart> ?? []
        return set.sorted {
            $0.partId < $1.partId
        }
    }

}

extension Colour : Identifiable {

}

extension Colour {

    public var wrappedName: String {
        return name ?? "None"
    }
    
    public var wrappedNote: String {
        return note ?? "None"
    }
            
}

// MARK: Generated accessors for paletteParts
extension Colour {

    @objc(addPalettePartsObject:)
    @NSManaged public func addToPaletteParts(_ value: PalettePart)

    @objc(removePalettePartsObject:)
    @NSManaged public func removeFromPaletteParts(_ value: PalettePart)

    @objc(addPaletteParts:)
    @NSManaged public func addToPaletteParts(_ values: NSSet)

    @objc(removePaletteParts:)
    @NSManaged public func removeFromPaletteParts(_ values: NSSet)

}

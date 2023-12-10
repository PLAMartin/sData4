//
//  PalettePart.swift
//  sData4
//
//  Created by Philip Martin on 15/08/2023.
//

import CoreData
import Foundation

@objc(PalettePart)
public class PalettePart: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case part_id, palette_id, colour_id, note, updated_at, palette, part, colour
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.partId = try container.decode(Int32.self, forKey: .part_id)
        self.paletteId = try container.decode(Int32.self, forKey: .palette_id)
        self.colourId = try container.decode(Int32.self, forKey: .colour_id)
        self.note = try container.decode(String.self, forKey: .note)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        // DEBUG
        print("inside PalettePart Init")
        
        //self.palette = try container.decode(Palette.self, forKey: .palette)
        self.part = try container.decode(Part.self, forKey: .part)
        part.addToPaletteParts(self)
        
        self.colour = try container.decode(Colour.self, forKey: .colour)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        print("In PalettePart encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(partId, forKey: .part_id)
        try container.encode(paletteId, forKey: .palette_id)
        try container.encode(colourId, forKey: .colour_id)
        try container.encode(note, forKey: .note)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension PalettePart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PalettePart> {
        return NSFetchRequest<PalettePart>(entityName: "PalettePart")
    }

    @NSManaged public var partId: Int32
    @NSManaged public var paletteId: Int32
    @NSManaged public var colourId: Int32
    @NSManaged public var note: String?
    @NSManaged public var updatedAt: Date
    
    @NSManaged public var colour: Colour
    //@NSManaged public var palette: Palette
    @NSManaged public var part: Part

}

extension PalettePart : Identifiable {

}

extension PalettePart {

    public var wrappedNote: String {
        return note ?? "Blank note"
    }
            
}

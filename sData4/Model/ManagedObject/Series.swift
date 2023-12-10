//
//  Series.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//

import CoreData
import Foundation

@objc(Series)
public class Series: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case series_id, palette_id, number, updated_at, boxes
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seriesId = try container.decode(Int32.self, forKey: .series_id)
        self.paletteId = try container.decode(Int32.self, forKey: .palette_id)
        self.number = try container.decode(Int32.self, forKey: .number)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }

}

extension Series {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Series> {
        return NSFetchRequest<Series>(entityName: "Series")
    }

    @NSManaged public var seriesId: Int32
    @NSManaged public var paletteId: Int32
    @NSManaged public var number: Int32
    @NSManaged public var updatedAt: Date

}

extension Series : Identifiable {
    
}


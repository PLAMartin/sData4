//
//  SeriesEpisode.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//

import CoreData
import Foundation

@objc(SeriesEpisode)
public class SeriesEpisode: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case series_id, episode_id, path_x, path_delta_y, updated_at
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
        self.pathX = try container.decode(Int32.self, forKey: .path_x)
        self.pathDeltaY = try container.decode(Int32.self, forKey: .path_delta_y)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }

}

extension SeriesEpisode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeriesEpisode> {
        return NSFetchRequest<SeriesEpisode>(entityName: "SeriesEpisode")
    }

    @NSManaged public var seriesId: Int32
    @NSManaged public var episodeId: Int32
    @NSManaged public var pathX: Int32
    @NSManaged public var pathDeltaY: Int32
    @NSManaged public var updatedAt: Date

}

extension SeriesEpisode : Identifiable {
    
}

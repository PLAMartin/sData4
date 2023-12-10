//
//  Episode.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Episode)
public class Episode: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case episode_id, number, updated_at, boxes, series_episodes
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.episodeId = try container.decode(Int32.self, forKey: .episode_id)
        self.number = try container.decode(Int32.self, forKey: .number)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
        let boxes = try container.decode(Set<Box>.self, forKey: .boxes)
        self.boxes = boxes as NSSet
        
        let seriesEpisodes = try container.decode(Set<SeriesEpisode>.self, forKey: .series_episodes)
        self.seriesEpisodes = seriesEpisodes as NSSet

    }

}

extension Episode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Episode> {
        return NSFetchRequest<Episode>(entityName: "Episode")
    }

    @NSManaged public var episodeId: Int32
    @NSManaged public var number: Int32
    @NSManaged public var updatedAt: Date
    @NSManaged public var boxes: NSSet?
    @NSManaged public var seriesEpisodes: NSSet?
    
    public var boxArray: [Box] {
        let set = boxes as? Set<Box> ?? []
        return set.sorted {
            $0.gridId < $1.gridId
        }
    }
    
    public var seriesEpisodeArray: [SeriesEpisode] {
        let set = boxes as? Set<SeriesEpisode> ?? []
        return set.sorted {
            $0.episodeId < $1.episodeId
        }
    }

}

extension Episode : Identifiable {
    
}

// MARK: Generated accessors for boxes
extension Episode {

    @objc(addBoxesObject:)
    @NSManaged public func addToBoxes(_ value: Box)

    @objc(removeBoxesObject:)
    @NSManaged public func removeFromBoxes(_ value: Box)

    @objc(addBoxes:)
    @NSManaged public func addToBoxes(_ values: NSSet)

    @objc(removeBoxes:)
    @NSManaged public func removeFromBoxes(_ values: NSSet)

}

// MARK: Generated accessors for seriesEpisodes
extension Episode {

    @objc(addSeriesEpisodesObject:)
    @NSManaged public func addToSeriesEpisodes(_ value: SeriesEpisode)

    @objc(removeSeriesEpisodesObject:)
    @NSManaged public func removeFromSeriesEpisodes(_ value: SeriesEpisode)

    @objc(addSeriesEpisodes:)
    @NSManaged public func addToSeriesEpisodes(_ values: NSSet)

    @objc(removeSeriesEpisodes:)
    @NSManaged public func removeFromSeriesEpisodes(_ values: NSSet)

}

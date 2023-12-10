//
//  Grid.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Grid)
public class Grid: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case grid_id, seed_id, tutorial_id, palette_id, name, load_count, play_count, completed_count, creator_user_id, updated_at, boxes, creator_user, palette, seed
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.gridId = try container.decode(Int32.self, forKey: .grid_id)
        self.seedId = try container.decode(Int32.self, forKey: .seed_id)
        self.tutorialId = try container.decode(Int32.self, forKey: .tutorial_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.loadCount = try container.decode(Int32.self, forKey: .load_count)
        self.playCount = try container.decode(Int32.self, forKey: .play_count)
        self.completedCount = try container.decode(Int32.self, forKey: .completed_count)
        self.creatorUserId = try container.decode(Int32.self, forKey: .creator_user_id)
        self.paletteId = try container.decode(Int32.self, forKey: .palette_id)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
        let boxes = try container.decode(Set<Box>.self, forKey: .boxes)
        self.boxes = boxes as NSSet
        
        //self.creatorUser = try container.decode(User.self, forKey: .creator_user)
        //self.palette = try container.decode(Palette.self, forKey: .palette)
        //self.seed = try container.decode(Seed.self, forKey: .seed)
        
    }

}

extension Grid {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Grid> {
        return NSFetchRequest<Grid>(entityName: "Grid")
    }

    @NSManaged public var gridId: Int32
    @NSManaged public var seedId: Int32
    @NSManaged public var tutorialId: Int32
    @NSManaged public var name: String?
    @NSManaged public var loadCount: Int32
    @NSManaged public var playCount: Int32
    @NSManaged public var completedCount: Int32
    @NSManaged public var creatorUserId: Int32
    @NSManaged public var paletteId: Int32
    @NSManaged public var updatedAt: Date
    
    @NSManaged public var boxes: NSSet?
    //@NSManaged public var creatorUser: User?
    //@NSManaged public var palette: Palette?
    //@NSManaged public var seed: Seed?

    public var boxArray: [Box] {
        let set = boxes as? Set<Box> ?? []
        return set.sorted {
            $0.gridId < $1.gridId
        }
    }

}

extension Grid : Identifiable {
    
}

extension Grid {

    public var wrappedName: String {
        return name ?? "None"
    }
            
}

// MARK: Generated accessors for boxes
extension Grid {

    @objc(addBoxesObject:)
    @NSManaged public func addToBoxes(_ value: Box)

    @objc(removeBoxesObject:)
    @NSManaged public func removeFromBoxes(_ value: Box)

    @objc(addBoxes:)
    @NSManaged public func addToBoxes(_ values: NSSet)

    @objc(removeBoxes:)
    @NSManaged public func removeFromBoxes(_ values: NSSet)

}

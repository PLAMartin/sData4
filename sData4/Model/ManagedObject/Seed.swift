//
//  Seed.swift
//  sData4
//
//  Created by Philip Martin on 17/08/2023.
//

import CoreData
import Foundation

@objc(Seed)
public class Seed: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case seed_id, rows, cols, moves_allowed, secs_allowed, note, updated_at
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seedId = try container.decode(Int32.self, forKey: .seed_id)
        //self.rows = try container.decode(Int32.self, forKey: .rows)
        //self.cols = try container.decode(Int32.self, forKey: .cols)
        //self.movesAllowed = try container.decode(Int32.self, forKey: .moves_allowed)
        //self.secsAllowed = try container.decode(Int32.self, forKey: .secs_allowed)
        //self.note = try container.decode(String.self, forKey: .note)

        //let dateAsString = try container.decode(String.self, forKey: .updated_at)
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
    }
    
    public func encode(to encoder: Encoder) throws {
      print("In Seed encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(seedId, forKey: .seed_id)
        //try container.encode(rows, forKey: .rows)
        //try container.encode(cols, forKey: .cols)
        //try container.encode(movesAllowed, forKey: .moves_allowed)
        //try container.encode(secsAllowed, forKey: .secs_allowed)
        //try container.encode(note, forKey: .note)
        //try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Seed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Seed> {
        return NSFetchRequest<Seed>(entityName: "Seed")
    }

    @NSManaged public var seedId: Int32
    //@NSManaged public var rows: Int32
    //@NSManaged public var cols: Int32
    //@NSManaged public var movesAllowed: Int32
    //@NSManaged public var secsAllowed: Int32
    //@NSManaged public var note: String?
    //@NSManaged public var updatedAt: Date?
    //@NSManaged public var grids: NSSet?
    //@NSManaged public var setup: Setup
    //@NSManaged public var spawns: NSSet?
    //@NSManaged public var targets: NSSet?
    /*
    public var gridArray: [Grid] {
        let set = grids as? Set<Grid> ?? []
        return set.sorted {
            $0.gridId < $1.gridId
        }
    }
    
    public var spawnArray: [Spawn] {
        let set = spawns as? Set<Spawn> ?? []
        return set.sorted {
            $0.seedId < $1.seedId
        }
    }
    
    public var targetArray: [Target] {
        let set = targets as? Set<Target> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
        }
    }
     */

}

extension Seed : Identifiable {
    
}

// MARK: Generated accessors for grids
extension Seed {

    @objc(addGridsObject:)
    @NSManaged public func addToGrids(_ value: Grid)

    @objc(removeGridsObject:)
    @NSManaged public func removeFromGrids(_ value: Grid)

    @objc(addGrids:)
    @NSManaged public func addToGrids(_ values: NSSet)

    @objc(removeGrids:)
    @NSManaged public func removeFromGrids(_ values: NSSet)

}

// MARK: Generated accessors for spawns
extension Seed {

    @objc(addSpawnsObject:)
    @NSManaged public func addToSpawns(_ value: Spawn)

    @objc(removeSpawnsObject:)
    @NSManaged public func removeFromSpawns(_ value: Spawn)

    @objc(addSpawns:)
    @NSManaged public func addToSpawns(_ values: NSSet)

    @objc(removeSpawns:)
    @NSManaged public func removeFromSpawns(_ values: NSSet)

}

// MARK: Generated accessors for targets
extension Seed {

    @objc(addTargetsObject:)
    @NSManaged public func addToTargets(_ value: Target)

    @objc(removeTargetsObject:)
    @NSManaged public func removeFromTargets(_ value: Target)

    @objc(addTargets:)
    @NSManaged public func addToTargets(_ values: NSSet)

    @objc(removeTargets:)
    @NSManaged public func removeFromTargets(_ values: NSSet)

}

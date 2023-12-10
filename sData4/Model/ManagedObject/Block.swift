//
//  Block.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Block)
public class Block: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case block_id, name, blocktype_id, connectable, targetable, shuffleable, spawnable, display_order, fill_part_id, stroke_part_id, inner_part_id, create_group, create_group_order, target_block_id, live, note, updated_at, blocktype, fill_part, inner_part, setups, spawns, stroke_part, targets, target_block
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.blockId = try container.decode(Int32.self, forKey: .block_id)
        self.blocktypeId = try container.decode(Int32.self, forKey: .blocktype_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.connectable = (try container.decode(Int.self, forKey: .connectable)) == 1
        self.shuffleable = (try container.decode(Int.self, forKey: .shuffleable)) == 1
        self.targetable = (try container.decode(Int.self, forKey: .targetable)) == 1
        self.spawnable = (try container.decode(Int.self, forKey: .spawnable)) == 1
        self.live = (try container.decode(Int.self, forKey: .live)) == 1
        self.displayOrder = try container.decodeIfPresent(Int32.self, forKey: .display_order) ?? 0
        self.fillPartId = try container.decodeIfPresent(Int32.self, forKey: .fill_part_id) ?? 0
        self.strokePartId = try container.decodeIfPresent(Int32.self, forKey: .stroke_part_id) ?? 0
        self.innerPartId = try container.decodeIfPresent(Int32.self, forKey: .inner_part_id) ?? 0
        self.createGroup = try container.decodeIfPresent(Int32.self, forKey: .create_group) ?? 0
        self.createGroupOrder = try container.decodeIfPresent(Int32.self, forKey: .create_group_order) ?? 0
        self.targetBlockId = try container.decodeIfPresent(Int32.self, forKey: .target_block_id) ?? 0
        self.note = try container.decode(String.self, forKey: .note)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        self.blocktype = try container.decodeIfPresent(Blocktype.self, forKey: .blocktype)
        print("blocktype: \(blocktype?.name ?? "Undefined blocktype name")")
        
        self.fillPart = try container.decodeIfPresent(Part.self, forKey: .fill_part)
        print("fillPart: \(fillPart?.name ?? "Undefined fill part")")
        
        self.strokePart = try container.decodeIfPresent(Part.self, forKey: .stroke_part)
        print("strokePart: \(strokePart?.name ?? "Undefined stroke part")")
        
        self.innerPart = try container.decodeIfPresent(Part.self, forKey: .inner_part)
        print("innerPart: \(innerPart?.name ?? "Undefined inner part")")

        //self.setups = try container.decode(Set<Setup>.self, forKey: .setups) as NSSet?
        
        //let set = targets as? Set<Target> ?? []
        //addToSetups(setups ?? [])
        
        //let setups = try container.decode([Setup].self, forKey: .setups)
        /*
        for setup in setups {
            addToSetups(setup)
            print("setup: \(setup)")
        }
         */
        
        
        //addToSetups(setups)
        
        /*
        for setup in setups {
            print("setup: \(setup)")
        }
        self.setups = setups as NSSet
         */

        
    }

}

extension Block {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Block> {
        return NSFetchRequest<Block>(entityName: "Block")
    }
    
    @nonobjc public class func sortedFetchRequest() -> NSFetchRequest<Block> {
      let sortDescriptors = [NSSortDescriptor(keyPath: \Block.displayOrder, ascending: true)]
      let request = NSFetchRequest<Block>(entityName: "Block")
      request.sortDescriptors = sortDescriptors
      return request
    }
    
    @NSManaged public var blockId: Int32
    @NSManaged public var blocktypeId: Int32
    @NSManaged public var connectable: Bool
    @NSManaged public var createGroup: Int32
    @NSManaged public var createGroupOrder: Int32
    @NSManaged public var displayOrder: Int32
    @NSManaged public var fillPartId: Int32
    @NSManaged public var innerPartId: Int32
    @NSManaged public var live: Bool
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var shuffleable: Bool
    @NSManaged public var spawnable: Bool
    @NSManaged public var strokePartId: Int32
    @NSManaged public var targetable: Bool
    @NSManaged public var targetBlockId: Int32
    @NSManaged public var updatedAt: Date?
    
    @NSManaged public var blocktype: Blocktype?
    @NSManaged public var fillPart: Part?
    @NSManaged public var innerPart: Part?
    @NSManaged public var strokePart: Part?
    @NSManaged public var setups: NSSet?
    //@NSManaged public var spawns: NSSet?
    //@NSManaged public var targets: NSSet?
    //@NSManaged public var targetBlock: Block?

    public var setupArray: [Setup] {
        let set = setups as? Set<Setup> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
        }
    }
    
/*
    public var spawnArray: [Spawn] {
        let set = spawns as? Set<Spawn> ?? []
        return set.sorted {
            $0.blockId < $1.blockId
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

extension Block : Identifiable {

}

extension Block {

    public var wrappedName: String {
        return name ?? "None"
    }
    
    public var wrappedNote: String {
        return note ?? "None"
    }
            
}

// MARK: Generated accessors for setups
extension Block {

    @objc(addSetupsObject:)
    @NSManaged public func addToSetups(_ value: Setup)

    @objc(removeSetupsObject:)
    @NSManaged public func removeFromSetups(_ value: Setup)

    @objc(addSetups:)
    @NSManaged public func addToSetups(_ values: NSSet)

    @objc(removeSetups:)
    @NSManaged public func removeFromSetups(_ values: NSSet)

}

// MARK: Generated accessors for spawns
extension Block {

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
extension Block {

    @objc(addTargetsObject:)
    @NSManaged public func addToTargets(_ value: Target)

    @objc(removeTargetsObject:)
    @NSManaged public func removeFromTargets(_ value: Target)

    @objc(addTargets:)
    @NSManaged public func addToTargets(_ values: NSSet)

    @objc(removeTargets:)
    @NSManaged public func removeFromTargets(_ values: NSSet)

}

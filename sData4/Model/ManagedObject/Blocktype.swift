//
//  Blocktype.swift
//  sData4
//
//  Created by Philip Martin on 16/08/2023.
//

import CoreData
import Foundation

@objc(Blocktype)
public class Blocktype: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case blocktype_id, name, note, updated_at, blocks
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.blocktypeId = try container.decode(Int32.self, forKey: .blocktype_id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "None"
        self.note = try container.decodeIfPresent(String.self, forKey: .note) ?? "None"
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        // DEBUG
        print("inside Blocktype Init")
        print("BlocktypeId: \(blocktypeId)")
        print("Name: \(wrappedName)")
        print("Note: \(wrappedNote)")
        
        let blocks = try container.decode(Set<Block>.self, forKey: .blocks) as NSSet
        //let blocks = try container.decode(Set<Block>?.self, forKey: .blocks) ?? []
        //let blocks = try container.decode([Block].self, forKey: .blocks)
        addToBlocks(blocks)
        
        
        print("Blocks count \(blocks.count)")

        for block in blocks {
            print("block: \(block)")
            //addToBlocks(block)
        }
        
        /*
        for friend in friends {
            // Associate each friend in the set with this user
            friend.addToFriendOrigin(self)
        }
        self.friends = friends as NSSet
         */
        
    }

}

extension Blocktype {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Blocktype> {
        return NSFetchRequest<Blocktype>(entityName: "Blocktype")
    }

    @NSManaged public var blocktypeId: Int32
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var updatedAt: Date
    @NSManaged public var blocks: NSSet? // [Block]?
    
    public var blockArray: [Block] {
        let set = blocks as? Set<Block> ?? []
        return set.sorted {
            //$0.blockId < $1.blockId
            $0.displayOrder < $1.displayOrder
        }
    }

}

extension Blocktype : Identifiable {

}

extension Blocktype {
    
    public var wrappedName: String {
        return name ?? "None"
    }
    
    public var wrappedNote: String {
        return note ?? "None"
    }
            
}


// MARK: Generated accessors for blocks
extension Blocktype {

    @objc(addBlocksObject:)
    @NSManaged public func addToBlocks(_ value: Block)

    @objc(removeBlocksObject:)
    @NSManaged public func removeFromBlocks(_ value: Block)

    @objc(addBlocks:)
    @NSManaged public func addToBlocks(_ values: NSSet)

    @objc(removeBlocks:)
    @NSManaged public func removeFromBlocks(_ values: NSSet)

}

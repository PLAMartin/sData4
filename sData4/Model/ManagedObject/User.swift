//
//  User.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//
// user_id, name, hash_number, gender, dob, xp, start_palette_id, active_effects, inventory, updated_at

import CoreData
import Foundation

@objc(User)
public class User: NSManagedObject, Decodable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case user_id, name, start_palette_id, updated_at, user_palettes
        //, gender, dob, xp, active_effects, inventory, grids, start_palette, user_palettes
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.userId = try container.decode(Int32.self, forKey: .user_id)
        self.name = try container.decode(String.self, forKey: .name)
        //self.gender = try container.decode(String.self, forKey: .gender)
        //self.dob = try container.decode(Date.self, forKey: .dob)
        //self.xp = try container.decode(Int32.self, forKey: .xp)
        self.startPaletteId = try container.decode(Int32.self, forKey: .start_palette_id)
        //self.activeEffects = try container.decode(String.self, forKey: .active_effects)
        //self.inventory = try container.decode(String.self, forKey: .inventory)

        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()
        
        //let grids = try container.decode(Set<Grid>.self, forKey: .grids)
        //self.grids = grids as NSSet
        
        //let startPalette = try container.decode(Palette.self, forKey: .start_palette)
        //self.startPalette = startPalette as Palette
        
        let userPalettes = try container.decode(Set<UserPalette>.self, forKey: .user_palettes) as NSSet
        
        for userPalette in userPalettes {
            print("userPalette: \(userPalette)")
        }
    }

}

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var name: String?
    //@NSManaged public var gender: String?
    //@NSManaged public var dob: Date?
    //@NSManaged public var xp: Int32
    @NSManaged public var startPaletteId: Int32
    //@NSManaged public var activeEffects: String?
    //@NSManaged public var inventory: String?
    @NSManaged public var updatedAt: Date
    
    //@NSManaged public var grids: NSSet?
    //@NSManaged public var startPalette: Palette?
    @NSManaged public var userPalettes: NSSet?
    
    /*
    public var gridArray: [Grid] {
        let set = grids as? Set<Grid> ?? []
        return set.sorted {
            $0.gridId < $1.gridId
        }
    }
*/
    public var userPaletteArray: [UserPalette] {
        let set = userPalettes as? Set<UserPalette> ?? []
        return set.sorted {
            $0.userId < $1.userId
        }
    }

}

extension User : Identifiable {
    
}

extension User {

    public var wrappedName: String {
        return name ?? "Unspecified name"
    }
            
}

// MARK: Generated accessors for grids
extension User {

    @objc(addGridsObject:)
    @NSManaged public func addToGrids(_ value: Grid)

    @objc(removeGridsObject:)
    @NSManaged public func removeFromGrids(_ value: Grid)

    @objc(addGrids:)
    @NSManaged public func addToGrids(_ values: NSSet)

    @objc(removeGrids:)
    @NSManaged public func removeFromGrids(_ values: NSSet)

}

// MARK: Generated accessors for userPalettes
extension User {

    @objc(addUserPalettesObject:)
    @NSManaged public func addToUserPalettes(_ value: UserPalette)

    @objc(removeUserPalettesObject:)
    @NSManaged public func removeFromUserPalettes(_ value: UserPalette)

    @objc(addUserPalettes:)
    @NSManaged public func addToUserPalettes(_ values: NSSet)

    @objc(removeUserPalettes:)
    @NSManaged public func removeFromUserPalettes(_ values: NSSet)

}

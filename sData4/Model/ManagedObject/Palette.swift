//
//  Palette.swift
//  sData4
//
//  Created by Philip Martin on 15/08/2023.
//
// One to many swiftui fetch request https://www.youtube.com/watch?v=0QGt0THnlwU&ab_channel=PaulHudson
// Check Friends app to handle NSSets (One to Many relationships)

import CoreData
import Foundation

@objc(Palette)
public class Palette: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case palette_id, name, note, updated_at, palette_parts, grids, series, user_palettes, users
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.paletteId = try container.decode(Int32.self, forKey: .palette_id)
        self.name = try container.decode(String.self, forKey: .name)
        self.note = try container.decode(String.self, forKey: .note)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        let paletteParts = try container.decode(Set<PalettePart>.self, forKey: .palette_parts) as NSSet
        addToPaletteParts(paletteParts)
        
        for palettePart in paletteParts {
            print("palettePart: \(palettePart)")
        }
        
        /*
        for friend in friends {
            // Associate each friend in the set with this user
            friend.addToFriendOrigin(self)
        }
        self.friends = friends as NSSet
         */
        
        let grids = try container.decode(Set<Grid>.self, forKey: .grids) as NSSet
        addToGrids(grids)
        
        let series = try container.decode(Set<Series>.self, forKey: .series) as NSSet
        addToSeries(series)
        
        let userPalettes = try container.decode(Set<UserPalette>.self, forKey: .user_palettes) as NSSet
        addToUserPalettes(userPalettes)
        
        let users = try container.decode(Set<User>.self, forKey: .users) as NSSet
        addToUsers(users)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        print("In Palette encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(paletteId, forKey: .palette_id)
        try container.encode(name, forKey: .name)
        try container.encode(note, forKey: .note)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension Palette {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Palette> {
        return NSFetchRequest<Palette>(entityName: "Palette")
    }

    @NSManaged public var paletteId: Int32
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var updatedAt: Date
    
    @NSManaged public var grids: NSSet?
    @NSManaged public var paletteParts: NSSet?
    @NSManaged public var series: NSSet?
    @NSManaged public var userPalettes: NSSet?
    @NSManaged public var users: NSSet?
    
    public var gridsArray: [Grid] {
        let set = grids as? Set<Grid> ?? []
        return set.sorted {
            $0.gridId < $1.gridId
        }
    }
    
    public var palettePartsArray: [PalettePart] {
        let set = paletteParts as? Set<PalettePart> ?? []
        return set.sorted {
            $0.partId < $1.partId
        }
    }
    
    public var userPalettesArray: [UserPalette] {
        let set = userPalettes as? Set<UserPalette> ?? []
        return set.sorted {
            $0.paletteId < $1.paletteId
        }
    }
    
    public var usersArray: [User] {
        let set = users as? Set<User> ?? []
        return set.sorted {
            $0.userId < $1.userId
        }
    }
    
    public var seriesArray: [Series] {
        let set = series as? Set<Series> ?? []
        return set.sorted {
            $0.seriesId < $1.seriesId
        }
    }

}

extension Palette : Identifiable {

}

extension Palette {

    public var wrappedName: String {
        return name ?? "Unspecified"
    }
    
    public var wrappedNote: String {
        return note ?? "None"
    }
            
}

// MARK: Generated accessors for grids
extension Palette {

    @objc(addGridsObject:)
    @NSManaged public func addToGrids(_ value: Grid)

    @objc(removeGridsObject:)
    @NSManaged public func removeFromGrids(_ value: Grid)

    @objc(addGrids:)
    @NSManaged public func addToGrids(_ values: NSSet)

    @objc(removeGrids:)
    @NSManaged public func removeFromGrids(_ values: NSSet)

}

// MARK: Generated accessors for paletteParts
extension Palette {

    @objc(addPalettePartsObject:)
    @NSManaged public func addToPaletteParts(_ value: PalettePart)

    @objc(removePalettePartsObject:)
    @NSManaged public func removeFromPaletteParts(_ value: PalettePart)

    @objc(addPaletteParts:)
    @NSManaged public func addToPaletteParts(_ values: NSSet)

    @objc(removePaletteParts:)
    @NSManaged public func removeFromPaletteParts(_ values: NSSet)

}

// MARK: Generated accessors for series
extension Palette {

    @objc(addSeriesObject:)
    @NSManaged public func addToSeries(_ value: Series)

    @objc(removeSeriesObject:)
    @NSManaged public func removeFromSeries(_ value: Series)

    @objc(addSeries:)
    @NSManaged public func addToSeries(_ values: NSSet)

    @objc(removeSeries:)
    @NSManaged public func removeFromSeries(_ values: NSSet)

}

// MARK: Generated accessors for userPalettes
extension Palette {

    @objc(addUserPalettesObject:)
    @NSManaged public func addToUserPalettes(_ value: UserPalette)

    @objc(removeUserPalettesObject:)
    @NSManaged public func removeFromUserPalettes(_ value: UserPalette)

    @objc(addUserPalettes:)
    @NSManaged public func addToUserPalettes(_ values: NSSet)

    @objc(removeUserPalettes:)
    @NSManaged public func removeFromUserPalettes(_ values: NSSet)

}

// MARK: Generated accessors for users
extension Palette {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

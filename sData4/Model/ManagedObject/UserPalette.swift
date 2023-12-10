//
//  UserPalette.swift
//  sData4
//
//  Created by Philip Martin on 18/08/2023.
//

import CoreData
import Foundation

@objc(UserPalette)
public class UserPalette: NSManagedObject, Codable {
    
    // What properties to decode
    enum CodingKeys: CodingKey {
        case user_id, palette_id, updated_at
    }

    // This initializer is called when decoding from JSON
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("NSManagedObjectContext is missing")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.userId = try container.decode(Int32.self, forKey: .user_id)
        self.paletteId = try container.decode(Int32.self, forKey: .palette_id)
        
        let dateAsString = try container.decode(String.self, forKey: .updated_at)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.updatedAt = dateFormatter.date(from: dateAsString) ?? Date()

        // DEBUG
        print("inside UserPalette Init")
        
    }
    
    public func encode(to encoder: Encoder) throws {
        print("In UserPalette encode")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .user_id)
        try container.encode(paletteId, forKey: .palette_id)
        try container.encode(updatedAt, forKey: .updated_at)
    }

}

extension UserPalette {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPalette> {
        return NSFetchRequest<UserPalette>(entityName: "UserPalette")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var paletteId: Int32
    @NSManaged public var updatedAt: Date

}

extension UserPalette : Identifiable {

}

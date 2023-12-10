//
//  Candy+CoreDataProperties.swift
//  sData4
//
//  Created by Philip Martin on 28/08/2023.
//
//
// https://www.youtube.com/watch?v=0QGt0THnlwU&ab_channel=PaulHudson

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}

extension Candy : Identifiable {

}

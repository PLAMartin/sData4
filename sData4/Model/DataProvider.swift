//
//  DataProvider.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//

import CoreData
import Foundation
import SwiftUI

// BASED ON: https://developer.apple.com/documentation/coredata/loading_and_displaying_a_large_data_feed
class DataProvider {
    
    init() {
        
        // Count records on a background thread
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        backgroundManagedObjectContext.performAndWait {
            
            // Access Colour entity
            let fetchRequestColour : NSFetchRequest<Colour> = Colour.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestColour)
                if itemCount == 0 {
                    
                    // No colour data exists, so go get it
                    print("No colour data exists, going out to get it...")
                    fetchAndSaveDataColour()
                    
                } else {
                    print("Colour data already exists.")
                }
                
            }
            catch let error as NSError {
                
                print("Error counting colours: \(error.localizedDescription)")
                
            }
            
            // PLAM
            // Access entities
            
            let fetchRequestPalette : NSFetchRequest<Palette> = Palette.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestPalette)
                if itemCount == 0 {
                    // No colour data exists, so go get it
                    print("No palette data exists, going out to get it...")
                    fetchAndSaveDataPalette()
                } else {
                    print("Palette data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting colours: \(error.localizedDescription)")
            }
            
            let fetchRequestBlock : NSFetchRequest<Block> = Block.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestBlock)
                if itemCount == 0 {
                    // No block data exists, so go get it
                    print("No block data exists, going out to get it...")
                    fetchAndSaveDataBlock()
                } else {
                    print("Block data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting blocks: \(error.localizedDescription)")
            }
            
            let fetchRequestBlocktype : NSFetchRequest<Blocktype> = Blocktype.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestBlocktype)
                if itemCount == 0 {
                    // No block data exists, so go get it
                    print("No blocktype data exists, going out to get it...")
                    fetchAndSaveDataBlocktype()
                } else {
                    print("Blocktype data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting blocks: \(error.localizedDescription)")
            }
            
            let fetchRequestPart : NSFetchRequest<Part> = Part.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestPart)
                if itemCount == 0 {
                    // No part data exists, so go get it
                    print("No part data exists, going out to get it...")
                    fetchAndSaveDataPart()
                } else {
                    print("Part data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting parts: \(error.localizedDescription)")
            }
            
            let fetchRequestPalettePart : NSFetchRequest<PalettePart> = PalettePart.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestPalettePart)
                if itemCount == 0 {
                    // No palette part data exists, so go get it
                    print("No palettePart data exists, going out to get it...")
                    fetchAndSaveDataPalettePart()
                } else {
                    print("PalettePart data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting paletteParts: \(error.localizedDescription)")
            }
            
            let fetchRequestGrid : NSFetchRequest<Grid> = Grid.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestGrid)
                if itemCount == 0 {
                    // No grid data exists, so go get it
                    print("No grid data exists, going out to get it...")
                    fetchAndSaveDataGrid()
                } else {
                    print("Grid data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting grids: \(error.localizedDescription)")
            }
            
            
            let fetchRequestUser : NSFetchRequest<User> = User.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestUser)
                if itemCount == 0 {
                    // No user data exists, so go get it
                    print("No user data exists, going out to get it...")
                    fetchAndSaveDataUser()
                } else {
                    print("User data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting users: \(error.localizedDescription)")
            }
            
            
            let fetchRequestSeed : NSFetchRequest<Seed> = Seed.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestSeed)
                if itemCount == 0 {
                    // No seed data exists, so go get it
                    print("No seed data exists, going out to get it...")
                    fetchAndSaveDataSeed()
                } else {
                    print("Seed data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting seeds: \(error.localizedDescription)")
            }
            
            let fetchRequestEpisode : NSFetchRequest<Episode> = Episode.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestEpisode)
                if itemCount == 0 {
                    // No episode data exists, so go get it
                    print("No seed data exists, going out to get it...")
                    fetchAndSaveDataEpisode()
                } else {
                    print("Episode data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting episodes: \(error.localizedDescription)")
            }
            
            
            let fetchRequestSeries : NSFetchRequest<Series> = Series.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestSeries)
                if itemCount == 0 {
                    // No series data exists, so go get it
                    print("No series data exists, going out to get it...")
                    fetchAndSaveDataSeries()
                } else {
                    print("Series data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting series: \(error.localizedDescription)")
            }
            
            let fetchRequestSetup : NSFetchRequest<Setup> = Setup.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestSetup)
                if itemCount == 0 {
                    // No setup data exists, so go get it
                    print("No setup data exists, going out to get it...")
                    fetchAndSaveDataSetup()
                } else {
                    print("Setup data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting setups: \(error.localizedDescription)")
            }
            
            let fetchRequestSpawn : NSFetchRequest<Spawn> = Spawn.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestSpawn)
                if itemCount == 0 {
                    // No spawn data exists, so go get it
                    print("No spawn data exists, going out to get it...")
                    fetchAndSaveDataSpawn()
                } else {
                    print("Spawn data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting spawns: \(error.localizedDescription)")
            }
            
            
            let fetchRequestTarget : NSFetchRequest<Target> = Target.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestTarget)
                if itemCount == 0 {
                    // No target data exists, so go get it
                    print("No target data exists, going out to get it...")
                    fetchAndSaveDataTarget()
                } else {
                    print("Target data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting targets: \(error.localizedDescription)")
            }
            
            
            let fetchRequestVariant : NSFetchRequest<Variant> = Variant.fetchRequest()
            do {
                let itemCount = try backgroundManagedObjectContext.count(for: fetchRequestVariant)
                if itemCount == 0 {
                    // No variant data exists, so go get it
                    print("No variant data exists, going out to get it...")
                    fetchAndSaveDataVariant()
                } else {
                    print("Variant data already exists.")
                }
            }
            catch let error as NSError {
                print("Error counting variants: \(error.localizedDescription)")
            }
            
            // PLAM end

        }

    }
    
    // Get colour data from Conxy site
    func fetchAndSaveDataColour() {
        print("In fetchAndSaveDataColour")

        // 1. Prepare a URLRequest to get colour data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceColour.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            // Now decode from JSON directly into Core Data managed objects
            // Do this on a background thread to avoid concurrency issues
            // SEE: https://stackoverflow.com/questions/49454965/how-to-save-to-managed-object-context-in-a-background-thread-in-core-data
            // SEE: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/Concurrency.html
            // SEE: https://www.donnywals.com/using-codable-with-core-data-and-nsmanagedobject/
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            // Set unused undoManager to nil for macOS (it is nil by default on iOS)
            // to reduce resource requirements.
            backgroundManagedObjectContext.undoManager = nil
            
            // Set the merge policy for duplicate entries – ensure that duplicate entries get merged into a single unique record
            // "To help resolve this, Core Data gives us constraints: we can make one attribute constrained so that it must always be unique. We can then go ahead and make as many objects as we want, unique or otherwise, but as soon as we ask Core Data to save those objects it will resolve duplicates so that only one piece of data gets written."
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Colour].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) colours placed into Core Data")
                                        
                } else {
                    print("Could not decode Colour from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
//                    // DEBUG: Count records
//                    let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
//                    do {
//                        let itemCount = try backgroundManagedObjectContext.count(for: fetchRequest)
//                        print("There are \(itemCount) users now.")
//                    }
//                    catch let error as NSError {
//                        print("Error counting users: \(error.localizedDescription)")
//                    }
                    
                    // Now actually try to load the avatars
                    //self.fetchAndSaveAvatars()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get colour data from Conxy site
    func fetchAndSaveDataPalette() {
        print("In fetchAndSaveDataPalette")
        
        // 1. Prepare a URLRequest to get palette data
        let url = URL(string: "https://www.conxy.co/php/ios/servicePalette.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Palette].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) palettes placed into Core Data")
                                        
                } else {
                    print("Could not decode Palette from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get block  data from Conxy site
    func fetchAndSaveDataBlock() {
        print("In fetchAndSaveDataBlock")

        // 1. Prepare a URLRequest to get block data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceBlock.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Block].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) blocks placed into Core Data")
                                        
                } else {
                    print("Could not decode Block from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get blocktype data from Conxy site
    func fetchAndSaveDataBlocktype() {
        print("In fetchAndSaveDataBlocktype")

        // 1. Prepare a URLRequest to get block data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceBlocktype.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Blocktype].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) blocktypes placed into Core Data")
                                        
                } else {
                    print("Could not decode Blocktype from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    
    // Get episode data from Conxy site
    func fetchAndSaveDataEpisode() {
        print("In fetchAndSaveDataEpisode")

        // 1. Prepare a URLRequest to get block data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceEpisode.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Episode].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) episodes placed into Core Data")
                                        
                } else {
                    print("Could not decode Episode from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    
    // Get part data from Conxy site
    func fetchAndSaveDataPart() {
        print("In fetchAndSaveDataPart")

        // 1. Prepare a URLRequest to get block data
        let url = URL(string: "https://www.conxy.co/php/ios/servicePart.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Part].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) parts placed into Core Data")
                                        
                } else {
                    print("Could not decode Part from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get palettePart data from Conxy site
    func fetchAndSaveDataPalettePart() {
        print("In fetchAndSaveDataPalettePart")

        // 1. Prepare a URLRequest to get block data
        let url = URL(string: "https://www.conxy.co/php/ios/servicePalettePart.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([PalettePart].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) paletteParts placed into Core Data")
                                        
                } else {
                    print("Could not decode PalettePart from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get grid data from Conxy site
    func fetchAndSaveDataGrid() {
        print("In fetchAndSaveDataGrid")

        // 1. Prepare a URLRequest to get grid data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceGrid.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Grid].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) grids placed into Core Data")
                                        
                } else {
                    print("Could not decode Grid from JSON into Core Data")
                }
                                                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                                
            }
            
        }.resume()

    }
    
    // Get user data from Conxy site
    func fetchAndSaveDataUser() {
        print("In fetchAndSaveDataUser")
        
        // 1. Prepare a URLRequest to get user data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceUser.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([User].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) users placed into Core Data")
                    
                } else {
                    print("Could not decode User from JSON into Core Data")
                }
                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                
            }
            
        }.resume()
    }
        
        
        // Get seed data from Conxy site
    func fetchAndSaveDataSeed() {
        print("In fetchAndSaveDataSeed")
        
        // 1. Prepare a URLRequest to get seed data
        let url = URL(string: "https://www.conxy.co/php/ios/serviceSeed.php")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let unwrappedData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // DEBUG: Inspect contents of JSON file retrieved from the server
            print(String(data: unwrappedData, encoding: .utf8)!)
            
            let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
            
            backgroundManagedObjectContext.undoManager = nil
            
            backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            // Decode on a background thread
            backgroundManagedObjectContext.performAndWait {
                
                // Decode into Core Data objects
                let decoder = JSONDecoder(context: backgroundManagedObjectContext)
                if let decodedData = try? decoder.decode([Seed].self, from: unwrappedData) {
                    
                    print("There were \(decodedData.count) seeds placed into Core Data")
                    
                } else {
                    print("Could not decode Seed from JSON into Core Data")
                }
                
                // Required to actually write the changes to Core Data
                do {
                    
                    // Save Core Data objects
                    try backgroundManagedObjectContext.save()
                    
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                
            }
            
        }.resume()
    }
    
    
    
    // Get series data from Conxy site
func fetchAndSaveDataSeries() {
    print("In fetchAndSaveDataSeries")
    
    // 1. Prepare a URLRequest to get series data
    let url = URL(string: "https://www.conxy.co/php/ios/serviceSeries.php")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    // 2. Run the request and process the response
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        // handle the result here – attempt to unwrap optional data provided by task
        guard let unwrappedData = data else {
            
            // Show the error message
            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
            
            return
        }
        
        // DEBUG: Inspect contents of JSON file retrieved from the server
        print(String(data: unwrappedData, encoding: .utf8)!)
        
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        
        backgroundManagedObjectContext.undoManager = nil
        
        backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Decode on a background thread
        backgroundManagedObjectContext.performAndWait {
            
            // Decode into Core Data objects
            let decoder = JSONDecoder(context: backgroundManagedObjectContext)
            if let decodedData = try? decoder.decode([Series].self, from: unwrappedData) {
                
                print("There were \(decodedData.count) series placed into Core Data")
                
            } else {
                print("Could not decode Series from JSON into Core Data")
            }
            
            // Required to actually write the changes to Core Data
            do {
                
                // Save Core Data objects
                try backgroundManagedObjectContext.save()
                
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }.resume()
}
    
    // Get setups data from Conxy site
func fetchAndSaveDataSetup() {
    print("In fetchAndSaveDataSetup")
    
    // 1. Prepare a URLRequest to get series data
    let url = URL(string: "https://www.conxy.co/php/ios/serviceSetup.php")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    // 2. Run the request and process the response
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        // handle the result here – attempt to unwrap optional data provided by task
        guard let unwrappedData = data else {
            
            // Show the error message
            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
            
            return
        }
        
        // DEBUG: Inspect contents of JSON file retrieved from the server
        print(String(data: unwrappedData, encoding: .utf8)!)
        
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        
        backgroundManagedObjectContext.undoManager = nil
        
        backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Decode on a background thread
        backgroundManagedObjectContext.performAndWait {
            
            // Decode into Core Data objects
            let decoder = JSONDecoder(context: backgroundManagedObjectContext)
            if let decodedData = try? decoder.decode([Setup].self, from: unwrappedData) {
                
                print("There were \(decodedData.count) setups placed into Core Data")
                
            } else {
                print("Could not decode Setup from JSON into Core Data")
            }
            
            // Required to actually write the changes to Core Data
            do {
                
                // Save Core Data objects
                try backgroundManagedObjectContext.save()
                
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }.resume()
}
    

    // Get spawn data from Conxy site
func fetchAndSaveDataSpawn() {
    print("In fetchAndSaveDataSpawn")
    
    // 1. Prepare a URLRequest to get spawn data
    let url = URL(string: "https://www.conxy.co/php/ios/serviceSpawn.php")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    // 2. Run the request and process the response
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        // handle the result here – attempt to unwrap optional data provided by task
        guard let unwrappedData = data else {
            
            // Show the error message
            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
            
            return
        }
        
        // DEBUG: Inspect contents of JSON file retrieved from the server
        print(String(data: unwrappedData, encoding: .utf8)!)
        
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        
        backgroundManagedObjectContext.undoManager = nil
        
        backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Decode on a background thread
        backgroundManagedObjectContext.performAndWait {
            
            // Decode into Core Data objects
            let decoder = JSONDecoder(context: backgroundManagedObjectContext)
            if let decodedData = try? decoder.decode([Spawn].self, from: unwrappedData) {
                
                print("There were \(decodedData.count) spawns placed into Core Data")
                
            } else {
                print("Could not decode Spawn from JSON into Core Data")
            }
            
            // Required to actually write the changes to Core Data
            do {
                
                // Save Core Data objects
                try backgroundManagedObjectContext.save()
                
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }.resume()
}
    
    // Get target data from Conxy site
func fetchAndSaveDataTarget() {
    print("In fetchAndSaveDataTarget")
    
    // 1. Prepare a URLRequest to get target data
    let url = URL(string: "https://www.conxy.co/php/ios/serviceTarget.php")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    // 2. Run the request and process the response
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        // handle the result here – attempt to unwrap optional data provided by task
        guard let unwrappedData = data else {
            
            // Show the error message
            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
            
            return
        }
        
        // DEBUG: Inspect contents of JSON file retrieved from the server
        print(String(data: unwrappedData, encoding: .utf8)!)
        
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        
        backgroundManagedObjectContext.undoManager = nil
        
        backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Decode on a background thread
        backgroundManagedObjectContext.performAndWait {
            
            // Decode into Core Data objects
            let decoder = JSONDecoder(context: backgroundManagedObjectContext)
            if let decodedData = try? decoder.decode([Target].self, from: unwrappedData) {
                
                print("There were \(decodedData.count) targets placed into Core Data")
                
            } else {
                print("Could not decode Target from JSON into Core Data")
            }
            
            // Required to actually write the changes to Core Data
            do {
                
                // Save Core Data objects
                try backgroundManagedObjectContext.save()
                
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }.resume()
}
    
    // Get variant data from Conxy site
func fetchAndSaveDataVariant() {
    print("In fetchAndSaveDataVariant")
    
    // 1. Prepare a URLRequest to get target data
    let url = URL(string: "https://www.conxy.co/php/ios/serviceVariant.php")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    // 2. Run the request and process the response
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        // handle the result here – attempt to unwrap optional data provided by task
        guard let unwrappedData = data else {
            
            // Show the error message
            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
            
            return
        }
        
        // DEBUG: Inspect contents of JSON file retrieved from the server
        print(String(data: unwrappedData, encoding: .utf8)!)
        
        let backgroundManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()
        
        backgroundManagedObjectContext.undoManager = nil
        
        backgroundManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        // Decode on a background thread
        backgroundManagedObjectContext.performAndWait {
            
            // Decode into Core Data objects
            let decoder = JSONDecoder(context: backgroundManagedObjectContext)
            if let decodedData = try? decoder.decode([Variant].self, from: unwrappedData) {
                
                print("There were \(decodedData.count) variants placed into Core Data")
                
            } else {
                print("Could not decode Variant from JSON into Core Data")
            }
            
            // Required to actually write the changes to Core Data
            do {
                
                // Save Core Data objects
                try backgroundManagedObjectContext.save()
                
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }.resume()
}
        
} // class DataProvider end

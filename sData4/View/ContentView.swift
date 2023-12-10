//
//  ContentView.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    @FetchRequest(sortDescriptors: []) var paletteParts: FetchedResults<PalettePart>

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Colour.colourId, ascending: true)],
        animation: .default)
    
    private var colours: FetchedResults<Colour>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Part.partId, ascending: true)],
        animation: .default)
    
    private var parts: FetchedResults<Part>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Palette.name, ascending: true)],
        animation: .default)
    
    private var palettes: FetchedResults<Palette>

    
    @FetchRequest(sortDescriptors: []) private var blocktypes: FetchedResults<Blocktype>
    
    @FetchRequest(fetchRequest: Block.sortedFetchRequest())
    var blocks: FetchedResults<Block>
    
    @FetchRequest(sortDescriptors: []) private var grids: FetchedResults<Grid>
    
    @FetchRequest(sortDescriptors: []) private var seeds: FetchedResults<Seed>

    var body: some View {
        
        
        NavigationStack {
            List {
                NavigationLink("Block", destination: BlockTable())
                NavigationLink("Blocktype", destination: BlocktypeTable())
                NavigationLink("Box", destination: BoxTable())
                NavigationLink("Colour", destination: ColourTable())
                NavigationLink("Episode", destination: EpisodeTable())
                NavigationLink("Grid", destination: GridTable())
                NavigationLink("Palette", destination: PaletteTable())
                NavigationLink("PalettePart", destination: PalettePartTable())
                NavigationLink("Part", destination: PartTable())
                NavigationLink("Seed", destination: SeedTable())
                NavigationLink("Series", destination: SeriesTable())
                NavigationLink("SeriesEpisode", destination: SeriesEpisodeTable())
                NavigationLink("Setup", destination: SetupTable())
                NavigationLink("Spawn", destination: SpawnTable())
                NavigationLink("Target", destination: TargetTable())
                NavigationLink("User", destination: UserTable())
                NavigationLink("UserPalette", destination: UserPaletteTable())
                NavigationLink("Variant", destination: VariantTable())
            }
            .navigationDestination(for: String.self) { value in
             Text("Table \(value)")
            }
            .navigationTitle("Tables")
            .listStyle(.grouped)
        }
        
        /*
        NavigationView {
            List(blocks, id: \.blockId) { block in
                VStack(alignment: .leading) {
                    Text("BlockId: \(block.blockId) ")
                        .font(.headline)
                    Text("Name: \(block.wrappedName) ")
                    Text("Blocktype name: \(block.blocktype?.wrappedName ?? "Unspecified") ")
                    //Text("Fill part id: \(block.fillPart?.partId ?? 0)")
                    //Text("Stroke part id: \(block.strokePart?.partId ?? 0)")
                }
            }
            .navigationTitle("Blocks")
        }
        
        NavigationView {
            List(blocktypes, id: \.blocktypeId) { blocktype in
                VStack(alignment: .leading) {
                    Text("Name: \(blocktype.wrappedName) ")
                        .font(.headline)
                    ForEach(blocktype.blockArray, id: \.displayOrder) { block in
                        Text("\(block.wrappedName)")
                    }
                }
            }
            .navigationTitle("Blocktypes")
        }
        
        NavigationView {
            List(colours, id: \.colourId) { colour in
                VStack(alignment: .leading) {
                    Text("\(colour.colourId) ")
                    Text("R\(colour.red) B\(colour.blue) G\(colour.green)")
                    Text(colour.wrappedName)
                    Text(colour.wrappedNote)
                        .font(.headline)
                }
            }
            .navigationTitle("Colours")
        }
        
        NavigationView {
            List(seeds, id: \.seedId) { seed in
                VStack(alignment: .leading) {
                    Text("Id : \(seed.seedId)")
                        .font(.headline)
                }
            }
            .navigationTitle("Seeds")
        }
    
        NavigationView {
            List(grids, id: \.gridId) { grid in
                VStack(alignment: .leading) {
                    Text(grid.wrappedName)
                        .font(.headline)
                }
            }
            .navigationTitle("Grids")
        }
        
        NavigationView {
            List(users, id: \.userId) { user in
                VStack(alignment: .leading) {
                    Text(user.wrappedName)
                        .font(.headline)
                    ForEach(user.userPaletteArray, id: \.self) { userPalette in
                        Text("\(userPalette.paletteId)")
                    }

                }
            }
            .navigationTitle("Users")
        }
        
        NavigationView {
            List(parts, id: \.partId) { part in
                VStack(alignment: .leading) {
                    Text(part.name)
                        .font(.headline)
                    Text(part.application)
                }
            }
            .navigationTitle("Parts")
        }
         
         */

    }


}

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView().environment(\.managedObjectContext,
                                    PersistenceController.preview.container.viewContext)
     }
 }
 

//
//  SpawnTable.swift
//  sData4
//
//  Created by Philip Martin on 04/12/2023.
//

import SwiftUI

struct SpawnTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.seedId),
                                    SortDescriptor(\.blockId)])
    private var spawns: FetchedResults<Spawn>
    
    var body: some View {
        NavigationView {
            List(spawns, id: \.self) { spawn in
                HStack(alignment: .top) {
                    Text("seed id: \(spawn.seedId)")
                    Text("block id: \(spawn.blockId)")
                }
            }
            .navigationTitle("Spawns")
        }
    }
}

#Preview {
    SpawnTable()
}

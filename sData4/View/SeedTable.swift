//
//  SeedTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct SeedTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.seedId)]) private var seeds: FetchedResults<Seed>
    
    var body: some View {
        
        NavigationView {
            List(seeds, id: \.seedId) { seed in
                VStack(alignment: .leading) {
                    Text("seed id : \(seed.seedId)")
                        .font(.headline)
                }
            }
            .navigationTitle("Seeds")
        }
    }
}

#Preview {
    SeedTable()
}

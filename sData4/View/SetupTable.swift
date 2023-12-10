//
//  SetupTable.swift
//  sData4
//
//  Created by Philip Martin on 04/12/2023.
//

import SwiftUI

struct SetupTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.seedId),
                                    SortDescriptor(\.row),
                                    SortDescriptor(\.col)])
    private var setups: FetchedResults<Setup>
    
    var body: some View {
        NavigationView {
            List(setups, id: \.self) { setup in
                HStack(alignment: .top) {
                    Text("seed id: \(setup.seedId)")
                    Text("row: \(setup.row)")
                    Text("col: \(setup.col)")
                    Text("block id: \(setup.blockId)")
                }
            }
            .navigationTitle("Setups")
        }
    }
}

#Preview {
    SetupTable()
}

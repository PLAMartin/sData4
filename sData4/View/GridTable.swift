//
//  GridTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct GridTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: []) private var grids: FetchedResults<Grid>
    
    var body: some View {
        
        NavigationView {
            List(grids, id: \.gridId) { grid in
                VStack(alignment: .leading) {
                    Text(grid.wrappedName)
                        .font(.headline)
                }
            }
            .navigationTitle("Grids")
        }
    }
}

#Preview {
    GridTable()
}

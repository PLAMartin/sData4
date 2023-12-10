//
//  PalettePartTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct PalettePartTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.partId),
                                    SortDescriptor(\.paletteId)])
    private var palettePart: FetchedResults<PalettePart>
    
    var body: some View {
        NavigationView {
            List(palettePart, id: \.self) { pp in
                HStack(alignment: .top) {
                    Text("part id: \(pp.partId)")
                    Text("palette id: \(pp.paletteId)")
                    Text("colour id: \(pp.colourId)")
                }
            }
            .navigationTitle("PaletteParts")
        }
    }
}

#Preview {
    PalettePartTable()
}

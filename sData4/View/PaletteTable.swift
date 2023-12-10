//
//  PaletteTable.swift
//  sData4
//
//  Created by Philip Martin on 08/12/2023.
//

import SwiftUI

struct PaletteTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.paletteId)])
    private var palettes: FetchedResults<Palette>
    
    var body: some View {
        NavigationView {
            List(palettes, id: \.paletteId) { palette in
                VStack(alignment: .leading) {
                    Text(palette.wrappedName)
                        .font(.headline)
                }
            }
            .navigationTitle("Palettes")
        }
    }
}

#Preview {
    PaletteTable()
}

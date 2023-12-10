//
//  ColourTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct ColourTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Colour.colourId, ascending: true)],
        animation: .default)
    
    private var colours: FetchedResults<Colour>
    
    var body: some View {
        
        NavigationView {
            List(colours, id: \.colourId) { colour in
                VStack(alignment: .leading) {
                    Text(colour.wrappedName)
                        .font(.headline)
                        .foregroundColor(Color(red: Double(colour.red) / 255,
                                               green: Double(colour.green) / 255,
                                               blue: Double(colour.blue) / 255))
                    Text("R\(colour.red) B\(colour.blue) G\(colour.green)")
                }
            }
            .navigationTitle("Colours")
        }
    }
}

#Preview {
    ColourTable()
}

//
//  SeriesTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct SeriesTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.number)])
    private var series: FetchedResults<Series>
    
    var body: some View {
        NavigationView {
            List(series, id: \.number) { s in
                HStack(alignment: .top) {
                    Text("series id: \(s.seriesId)")
                    Text("palette id: \(s.paletteId)")
                }
            }
            .navigationTitle("Series")
        }
    }
}

#Preview {
    SeriesTable()
}

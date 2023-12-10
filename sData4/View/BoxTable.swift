//
//  BoxTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct BoxTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.seriesId),
        SortDescriptor(\.episodeId),
        SortDescriptor(\.variantId)
    ])
    private var boxes: FetchedResults<Box>
    
    var body: some View {
        NavigationView {
            List(boxes, id: \.self) { box in
                HStack(alignment: .top) {
                    Text("series id: \(box.seriesId)")
                    Text("episode id: \(box.episodeId)")
                    Text("variant id: \(box.variantId)")
                }
            }
            .navigationTitle("Boxes")
        }
    }
}

#Preview {
    BoxTable()
}

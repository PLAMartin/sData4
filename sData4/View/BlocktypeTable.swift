//
//  BlocktypeTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct BlocktypeTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: []) private var blocktypes: FetchedResults<Blocktype>
    
    var body: some View {
        
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
    }

}

#Preview {
    BlocktypeTable()
}

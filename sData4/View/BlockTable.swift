//
//  BlockTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct BlockTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(fetchRequest: Block.sortedFetchRequest())
    var blocks: FetchedResults<Block>
    
    var body: some View {
        
        NavigationView {
            List(blocks, id: \.blockId) { block in
                VStack(alignment: .leading) {
                    Text("BlockId: \(block.blockId) ")
                        .font(.headline)
                    Text("Name: \(block.wrappedName) ")
                    Text("Blocktype name: \(block.blocktype?.wrappedName ?? "Unspecified") ")
                    //Text("Fill part id: \(block.fillPart?.partId ?? 0)")
                    //Text("Stroke part id: \(block.strokePart?.partId ?? 0)")
                }
            }
            .navigationTitle("Blocks")
        }
    }
}

#Preview {
    BlockTable()
}

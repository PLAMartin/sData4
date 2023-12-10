//
//  TargetTable.swift
//  sData4
//
//  Created by Philip Martin on 04/12/2023.
//

import SwiftUI

struct TargetTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.seedId),
                                    SortDescriptor(\.blockId)])
    private var targets: FetchedResults<Target>
    
    var body: some View {
        NavigationView {
            List(targets, id: \.self) { target in
                HStack(alignment: .top) {
                    Text("seed id: \(target.seedId)")
                    Text("block id: \(target.blockId)")
                    Text("target: \(target.target)")
                }
            }
            .navigationTitle("Targets")
        }
    }
}

#Preview {
    TargetTable()
}

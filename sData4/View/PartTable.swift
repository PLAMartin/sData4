//
//  PartTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct PartTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: []) private var parts: FetchedResults<Part>
    
    var body: some View {
        
        NavigationView {
            List(parts, id: \.partId) { part in
                VStack(alignment: .leading) {
                    Text(part.name)
                        .font(.headline)
                    Text(part.application)
                }
            }
            .navigationTitle("Parts")
        }
    }
    
}

#Preview {
    PartTable()
}

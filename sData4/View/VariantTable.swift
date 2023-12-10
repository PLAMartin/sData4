//
//  VariantTable.swift
//  sData4
//
//  Created by Philip Martin on 05/12/2023.
//

import SwiftUI

struct VariantTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.displayOrder)])
    private var variants: FetchedResults<Variant>
    
    var body: some View {
        NavigationView {
            List(variants, id: \.variantId) { variant in
                HStack(alignment: .top) {
                    Text("variant id: \(variant.variantId)")
                }
            }
            .navigationTitle("Variants")
        }
    }
}

#Preview {
    VariantTable()
}

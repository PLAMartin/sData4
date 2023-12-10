//
//  UserPaletteTable.swift
//  sData4
//
//  Created by Philip Martin on 04/12/2023.
//

import SwiftUI

struct UserPaletteTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.userId),
                                    SortDescriptor(\.paletteId)])
    private var userPalettes: FetchedResults<UserPalette>
    
    var body: some View {
        NavigationView {
            List(userPalettes, id: \.self) { up in
                HStack(alignment: .top) {
                    Text("user id: \(up.userId)")
                    Text("palette id: \(up.paletteId)")
                }
            }
            .navigationTitle("UserPalettes")
        }
    }
}

#Preview {
    UserPaletteTable()
}

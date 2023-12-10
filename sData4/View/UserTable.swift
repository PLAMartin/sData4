//
//  UserTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct UserTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.userId)])
    private var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            List(users, id: \.userId) { user in
                VStack(alignment: .leading) {
                    Text(user.wrappedName)
                        .font(.headline)
                }
            }
            .navigationTitle("Grids")
        }
    }
}

#Preview {
    UserTable()
}

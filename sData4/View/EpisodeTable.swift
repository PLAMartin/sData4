//
//  EpisodeTable.swift
//  sData4
//
//  Created by Philip Martin on 03/12/2023.
//

import SwiftUI

struct EpisodeTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.number)])
    private var episodes: FetchedResults<Episode>
    
    var body: some View {
        NavigationView {
            List(episodes, id: \.number) { episode in
                HStack(alignment: .top) {
                    Text("episode id: \(episode.episodeId)")
                }
            }
            .navigationTitle("Episodes")
        }
    }
}

#Preview {
    EpisodeTable()
}

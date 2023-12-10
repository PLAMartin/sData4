//
//  SeriesEpisodeTable.swift
//  sData4
//
//  Created by Philip Martin on 04/12/2023.
//

import SwiftUI

struct SeriesEpisodeTable: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.seriesId),
                                    SortDescriptor(\.episodeId)])
    private var seriesEpisode: FetchedResults<SeriesEpisode>
    
    var body: some View {
        NavigationView {
            List(seriesEpisode, id: \.self) { se in
                HStack(alignment: .top) {
                    Text("series id: \(se.seriesId)")
                    Text("episode id: \(se.episodeId)")
                }
            }
            .navigationTitle("SeriesEpisodes")
        }
    }
}

#Preview {
    SeriesEpisodeTable()
}

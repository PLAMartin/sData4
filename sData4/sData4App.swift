//
//  sData4App.swift
//  sData4
//
//  Created by Philip Martin on 14/08/2023.
//

import SwiftUI

@main
struct sData4App: App {
    // Connect to Core Data store
    //let persistenceController = PersistenceController.shared
    let persistenceController: PersistenceController

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    init() {
        
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {

            persistenceController = PersistenceController.preview
            
        } else {
            
            persistenceController = PersistenceController.shared

            // Kick off loading users from JSON or Core Data
            _ = DataProvider()
        }
        
    }
    
    
}

/*

 import SwiftUI

 @main
 struct FriendsApp: App {
     
     // Connect to Core Data store
     let persistenceController: PersistenceController
     
     // For showing badges
     // SEE: https://medium.com/flawless-app-stories/swiftui-tutorial-showing-badge-on-tab-bar-item-d71e4075b67a
     private var badgeCount: Int = 1
     private var badgePosition: CGFloat = 2
     private var tabsCount: CGFloat = 2
     
     // Count of unseen users in the inner circle
     @StateObject var innerCircleStats = InnerCircleDataProvider()
         
     var body: some Scene {
         WindowGroup {
             
             GeometryReader { geo in
                 
                 ZStack(alignment: .bottomLeading) {
                     
                     TabView {
                         
                         NavigationView {
                             UserListView()
                         }
                         .tabItem {
                             Image(systemName: "person")
                             Text("Friends")
                         }
                         
                         NavigationView {
                             UserListView(onlyInnerCircle: true)
                         }
                         .tabItem {
                             Image(systemName: "heart.circle.fill")
                             Text("Inner Circle")
                         }
                         
                     }
                     // Provide access to core data through the environment
                     .environment(\.managedObjectContext, persistenceController.container.viewContext)
                     .environmentObject(innerCircleStats)
                     
                     ZStack {
                       Circle()
                         .foregroundColor(.red)

                         Text("\(innerCircleStats.unseenUsersCount)")
                         .foregroundColor(.white)
                         .font(Font.system(size: 12))
                     }
                     .frame(width: 15, height: 15)
                     .offset(x: ( ( 2 * badgePosition) - 0.95 ) * ( geo.size.width / ( 2 * tabsCount ) ) + 2, y: -30)
                     .opacity(innerCircleStats.unseenUsersCount == 0 ? 0 : 1.0)

                 }
                 
             }

         }

     }
     
     init() {
         
         if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {

             persistenceController = PersistenceController.preview
             
         } else {
             
             persistenceController = PersistenceController.shared

             // Kick off loading users from JSON or Core Data
             _ = DataProvider()
         }
         
     }
 }

 */

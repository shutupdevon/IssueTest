//
//  IssueTestApp.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

@main
struct IssueTestApp: App {
    @StateObject private var navigation = NavigationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.context)
                .environmentObject(navigation)
        }
    }
}

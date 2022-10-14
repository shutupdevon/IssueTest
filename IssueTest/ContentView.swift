//
//  ContentView.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var navigation: NavigationManager
    
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } detail: {
            NavigationStack(path: $navigation.path) {
                ParentView()
                    .toolbar {
                        Button {
                            let newBoard = Board(context: moc)
                            newBoard.name = "New Board"
                            
                            try? moc.save()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .navigationDestination(for: Board.self) { board in
                        ParentView(parent: board)
                            .toolbar {
                                Button {
                                    let newBoard = Board(context: moc)
                                    newBoard.name = "New Board"
                                   
                                    board.addToItems(newBoard)
                                
                                    try? moc.save()
                                } label: {
                                    Image(systemName: "plus")
                                }

                            }
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.context)
            .environmentObject(NavigationManager())
    }
}

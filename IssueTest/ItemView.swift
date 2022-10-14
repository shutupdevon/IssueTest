//
//  ItemView.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

struct ItemView: View {
    
   
    @ObservedObject var item: Item
    
    @EnvironmentObject var navigaton: NavigationManager
    
    var body: some View {
        itemView(of: item)
    }
    
    @ViewBuilder
    func itemView(of item: Item) -> some View {
        switch item {
        case let board as Board:
            BoardView(board: board)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    navigaton.path.append(board)
                }
        default:
            Text("Default")
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let newBoard = Board(context: CoreDataManager.shared.context)
        newBoard.name = "Board"
        
        return ItemView(item: newBoard)
            .environmentObject(NavigationManager())
    }
}

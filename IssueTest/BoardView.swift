//
//  BoardView.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

struct BoardView: View {
    
   
    @ObservedObject var board: Board
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.teal)
            .aspectRatio(contentMode: .fit)
            .overlay {
                SelectionView(item: board)
            }
            
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let newBoard = Board(context: CoreDataManager.shared.context)
        newBoard.name = "Board"
        
        return BoardView(board: newBoard)
    }
}

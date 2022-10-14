//
//  ParentView.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

struct ParentView: View {
    
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<Item>
    @Environment(\.managedObjectContext) var moc
    
    var parent: Board?
    
    var body: some View {
        VStack {
            ForEach(items.filter { $0.parent == parent }) { item in
                ItemView(item: item)
                    .contextMenu {
                        Button {
                            moc.delete(item)
                            try? moc.save()
                        } label: {
                            Text("Delete item")
                        }

                        
                    }
            }
        }
        
       
    }
    
  
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.context)
            
    }
}

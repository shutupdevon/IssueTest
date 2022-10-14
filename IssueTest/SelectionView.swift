//
//  SelectionView.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import SwiftUI

struct SelectionView: View {
    
    @ObservedObject var item: Item
    @State private var popover: Bool = false
    
    var body: some View {
        VStack {
            
            Button {
                self.popover = true
            } label: {
                Text("Show popover")
            }
        }
        .popover(isPresented: $popover) {
            Text("Some popover")
        }
    }
}

//struct SelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectionView()
//    }
//}

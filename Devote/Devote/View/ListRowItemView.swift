//
//  ListRowItemView.swift
//  Devote
//
//  Created by Faiq on 01/10/2021.
//

import SwiftUI

struct ListRowItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink: Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            /**
             Take publisher as a parameter and when a change occurs, it will save it*/
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}

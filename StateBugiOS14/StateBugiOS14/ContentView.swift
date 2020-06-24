//
//  ContentView.swift
//  StateBugiOS14
//
//  Created by Jeremy Gale on 2020-05-29.
//  Copyright © 2020 Jeremy Gale. All rights reserved.
//

import SwiftUI

struct ListItem: Identifiable {
    var id = UUID()
    var title: String
}

struct ListSection: Identifiable {
    var id = UUID()
    var name: String
    var items: [ListItem] = []
}

struct ContentView: View {
    let sections = [
        ListSection(name: "Even Items", items: [
                        ListItem(title: "Item A"),
                        ListItem(title: "Item B")]),
        ListSection(name: "Odd Items", items: [
                        ListItem(title: "Item C"),
                        ListItem(title: "Item D")])
    ]
    
    @State var showSheet = false
    @State var shownItem:  ListItem?
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        Text(item.title)
                            .onTapGesture {
                                self.shownItem = item
                                self.showSheet.toggle()
                            }
                    }
                }
            }
        }
        .sheet(isPresented: self.$showSheet) {
            if let item = self.shownItem {
                Text(item.title)
            } else {
                Color.red
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

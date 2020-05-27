//
//  ContentView.swift
//  DemoList
//
//  Created by Rishabh on 27/05/20.
//  Copyright © 2020 Rishabh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    
    var body: some View {
        
        NavigationView {

            List {
                Section(header: Text("List of items")) {
                    
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform : deleteItem)
                    .onMove(perform: moveRow)
                }
            }.navigationBarTitle(Text("List in SwiftUI"))
             .navigationBarItems(
                leading: Button("Add Row", action: {
                    self.addRow()
                }),
                trailing: EditButton())
        }
    }
    
    private func addRow() {
        self.items.append("NEW ROW")
    }
    
    private func deleteItem(atIndex: IndexSet) {
        
        if let first = atIndex.first {
            items.remove(at: first)
        }
    }
    
    private func moveRow(atIndex: IndexSet, destination: Int) {
        
        if let first = atIndex.first {
            items.insert(items.remove(at: first), at: destination > first ? destination - 1 : destination)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

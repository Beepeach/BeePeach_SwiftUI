//
//  ContentView.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct StaticListView: View {
    var body: some View {
        List {
            Text("Hello, world")
        }
        .listStyle(.insetGrouped)
    }
}

struct StaticListViewDemo: View {
    var body: some View {
        NavigationStack {
            StaticListView()
                .navigationTitle("List with Simple Row")
        }
    }
}

#Preview {
    StaticListViewDemo()
}

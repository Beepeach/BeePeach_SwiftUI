//
//  ListApp.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

@main
struct ListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SearchableBooksListView()
            }
        }
    }
}

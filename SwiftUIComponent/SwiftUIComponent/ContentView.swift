//
//  ContentView.swift
//  SwiftUIComponent
//
//  Created by JunHeeJo on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HStack(spacing: 20) {
                // left
                Text("Hello world")
                    .padding()
                    .background(.red)
                    .navigationTitle("Inner title")
                
                // right
                Text("Hello world")
                    .background(.red)
                    .padding()
            }
            .navigationTitle("Outer title")
            
            VStack(alignment: .leading) {
                Text("Hello, World")
                Text("How are you today?")
            }
            .font(.system(.body, design: .monospaced))
        }
        .navigationTitle("Final Title")
    }
}

#Preview {
    ContentView()
}

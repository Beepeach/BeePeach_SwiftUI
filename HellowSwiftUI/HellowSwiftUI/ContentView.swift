//
//  ContentView.swift
//  HellowSwiftUI
//
//  Created by JUNHEE JO on 9/3/25.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    private var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    private var greetingText: String {
        trimmedName.isEmpty ? "Hello" : "Hello, \(trimmedName)"
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            TextField("Enter your name Here", text: $name)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .border(.pink, width: 1)
                .padding(.all)

            Text(greetingText)
                .font(.title2)
                .foregroundColor(Color.orange)

            Button("Clear") {
                name = ""
            }
            .padding(.all)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

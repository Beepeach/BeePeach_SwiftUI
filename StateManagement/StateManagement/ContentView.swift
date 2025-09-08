//
//  ContentView.swift
//  StateManagement
//
//  Created by JunHeeJo on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var color: Color = Color.accentColor
    
    var body: some View {
        VStack(alignment: .leading) {
            StateStepper()
            ObservedStepper()
            ColorPicker("Pick a color", selection: $color)
        }
        .foregroundStyle(color)
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  StaticListView2.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct StaticListView2: View {
    @State var number: Int = 42
    @State var degrees: Double = 37.5
    @State var toggle = true
    @State var name = "BeePeach"
    @State var secret = "s3cr3t!"
    
    var fruits = ["Apples", "Bananas", "Mangoes"]
    @State var fruit = "Mangoes"
    
    var body: some View {
        List {
            Text("Hello BeePeach")
            Label("The answer", systemImage: "42.circle")
            Slider(value: $degrees, in: 0...50) {
                Text("\(degrees)")
            } minimumValueLabel: {
                Text("min")
            } maximumValueLabel: {
                Text("max")
            }
            Stepper(value: $number, in: 0...100) {
                Text("\(number)")
            }
            Toggle(isOn: $toggle) {
                Text("Checked")
            }
            TextField("Name", text: $name)
            SecureField("Secret", text: $secret)
            ProgressView(value: 0.3)
            Picker(selection: $fruit, label: Text("Pick your favourite fruit")) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        StaticListView2()
            .listStyle(.insetGrouped)
            .navigationTitle("List with multiple List")
    }
}

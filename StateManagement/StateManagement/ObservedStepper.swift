//
//  ObservedStepper.swift
//  StateManagement
//
//  Created by JunHeeJo on 9/8/25.
//


import SwiftUI

struct ObservedStepper: View {
    @ObservedObject var counter = Counter()
    
    var body: some View {
        Section(header: Text("@ObservedObject")) {
            Stepper("Counter: \(counter.count)", value: $counter.count)
        }
    }
}

//
//  StateStepper.swift
//  StateManagement
//
//  Created by JunHeeJo on 9/8/25.
//


import SwiftUI

struct StateStepper: View {
    @StateObject var stateCounter = Counter()
    
    var body: some View {
        Section(header: Text("@StateObject")) {
            Stepper("Counter: \(stateCounter.count)", value: $stateCounter.count)
        }
    }
}
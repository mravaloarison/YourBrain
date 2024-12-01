//
//  ContentView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var goal: String = ""
    @State private var isRunning: Bool = ControlManager.shared.isRunning

    var body: some View {
        VStack (spacing: 21) {
            Text("Test!")
                .font(.title)
                .padding()
            Text("IsRunning: \(isRunning)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var defaultView = 2
    
    var body: some View {
        TabView(selection: $defaultView) {
            Text("Generated story for user")
                .tabItem {
                    Label("Daily story", systemImage: "wand.and.stars")
                }
            Text("This View represent the emptiness in your Brain")
                .tabItem {
                    Label("Nothing", systemImage: "shippingbox.fill")
                }
                .tag(1)
            NavigationStack {
                SettingsViews()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(2)
        }
    }
}

#Preview {
    ContentView()
}

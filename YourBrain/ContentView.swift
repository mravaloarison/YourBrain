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
            Text("This View represent the emptiness in your Brain")
                .tabItem {
                    Image(systemName: "shippingbox.fill")
                    Text("Nothing")
                }
                .tag(1)
            NavigationStack {
                SettingsViews()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(2)
        }
    }
}

#Preview {
    ContentView()
}

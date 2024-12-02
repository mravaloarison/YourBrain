//
//  ContentView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 11/30/24.
//

import SwiftUI
import UserNotifications
import GoogleGenerativeAI

struct ContentView: View {
    @State private var defaultView = 2
    @State private var isNotif = false
    @State private var generatedText: String = ""
    @State private var isLoading: Bool = true
    
    var body: some View {
        TabView(selection: $defaultView) {
            Text("Generated story for user")
                .tabItem {
                    Label("Daily story", systemImage: "wand.and.stars")
                }
            NothingView()
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
        .onAppear() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    isNotif = true
                } else if let error {
                    print(error.localizedDescription)
                }
            }
        }
        .onChange(of: isNotif) {
            if isNotif {
                let content = UNMutableNotificationContent()
                content.title = "🤔"
                content.subtitle = generatedText
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    private func generateStory() {
        Task {
            do {
                let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: GeminiAPIKey.default)
                let prompt = "The user has been on their screen too much, send a short notification roasting them, like 'pepole out there making dollars...' or sum similar'"
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    DispatchQueue.main.async {
                        self.generatedText = text
                        self.isLoading = false
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.generatedText = "Failed to load the AI: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

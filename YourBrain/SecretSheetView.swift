//
//  SecretSheetView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import SwiftUI
import GoogleGenerativeAI

struct SecretSheetView: View {
    @State private var Brainrot = false
    @State private var generatedText: String = ""
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            Toggle("Brainrot", isOn: $Brainrot)
                .tint(.purple)
                .padding()
            Spacer()
            if isLoading {
                ProgressView()
            } else {
                Text(generatedText)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: generateTaskForUser)
        .onChange(of: Brainrot) {
            generateTaskForUser()
        }
    }
    
    private func generateTaskForUser() {
        Task {
            do {
                let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: GeminiAPIKey.default)
                let prompt = "Give the user some usefull task to do related to if their career dream job is '\(ControlManager.shared.goal)' give them one example of things they can do today useful instead of being on their phone in one sentence. add some emoji"
                let prompt2 = "Give the user random funny action to do, for example, go say hi to a table, add some emoji and one sentence, make the joke related to \(ControlManager.shared.goal) jobs"
                let response = try await model.generateContent(self.Brainrot ? prompt2 : prompt)
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
    SecretSheetView()
}

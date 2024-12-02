//
//  NothingView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import SwiftUI
import GoogleGenerativeAI

struct NothingView: View {
    // MAKE A CALL: api.giphy.com/v1/gifs/search?api_key=&q=who
    
    // GEMINI:
    @State private var generatedText: String = "Generating story..."
    @State private var isLoading: Bool = true
    
    let url = URL(string:"https://giphy.com/embed/h1V3tMWqc3lr8cfYIy")!
    
    var body: some View {
        ZStack {
            GifImageView(url: url)
                .ignoresSafeArea()

            VStack {
                if isLoading {
                    
                    ProgressView("Wait for it...")
                } else {
                    Text(generatedText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .padding(.top, 36)
        }
        .onAppear(perform: generateStory)
    }
    
    private func generateStory() {
        Task {
            do {
                let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: GeminiAPIKey.default)
                let prompt = "Tell the user that this app view represents the emptyness of their brain in a short sentence add emoji"
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
    NothingView()
}

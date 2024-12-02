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
    @State private var generatedText: String = "Here is what YourBrain says about you 🤣"
    @State private var isLoading: Bool = true
    @State private var countTapGesture = 0
    @State private var secretSheet:Bool = false
    
    let url = URL(string:"https://giphy.com/embed/h1V3tMWqc3lr8cfYIy")!

    var body: some View {
        ZStack {
            GifImageView(url: url)
                .ignoresSafeArea()
            VStack {
                Spacer()
                if isLoading {
                    ProgressView()
                } else {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.black.opacity(0.5))
                        .frame(maxHeight: 204)
                        .overlay(content: {
                            Text(generatedText)
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                                .multilineTextAlignment(.center)
                            })
                        .padding()
                }
                Spacer()
            }
            .padding(.top, 36)
        }
        .gesture(tapGesture)
        .sheet(isPresented: $secretSheet) {
            SecretSheetView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(18)

        }
        .onAppear(perform: generateStory)
    }
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
                if countTapGesture == 6 {
                    secretSheet = true
                    countTapGesture = 0
                } else {
                    secretSheet = false
                    countTapGesture += 1
                }
                print("Clicked")
            }
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

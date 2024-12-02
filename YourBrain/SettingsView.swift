//
//  SettingViews.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import SwiftUI

struct SettingsViews: View {
    @ObservedObject private var controlManager = ControlManager.shared
    
    var body: some View {
        List {
            Section("Available Option") {
                Toggle("Activate", isOn: $controlManager.isRunningValue)
                    .tint(.pink)
            }
            
            Section("humm") {
                HStack {
                    Text("Dream Job")
                    Spacer()
                    TextField("Squirrel Psychiatrist", text: $controlManager.goal)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                Picker("Gender", selection: $controlManager.selectedEthnicity) {
                    ForEach(controlManager.ethnicity, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section("daily achievement") {
                VStack(spacing: 21) {
                    Text("🎉")
                        .font(.largeTitle)
                    Text("Congratulations!")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("You have officially installed YourBrain. Use it wisely, it's your first one!")
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                Button {
                    // TODO: Button learn how to use your brain
                } label: {
                    Text("Learn how to use it").frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("🧠 YourBrain")
    }
}

#Preview {
    SettingsViews()
}

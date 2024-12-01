//
//  YourBrainWidgetsControl.swift
//  YourBrainWidgets
//
//  Created by Mami Ravaloarison on 11/30/24.
//

import AppIntents
import SwiftUI
import WidgetKit

struct YourBrainWidgetsControl: ControlWidget {
    static let kind: String = "mravaloarison9623.YourBrain.YourBrainWidgets"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: Self.kind
        ) {
            ControlWidgetToggle(
                "YourBrain",
                isOn: ControlManager.shared.isRunningValue,
                action: ToggleTimerIntent(),
                valueLabel: { isOn in
                    Label(isOn ? "On" : "Off",
                          systemImage: "brain.filled.head.profile")
                }
            )
            .tint(.pink)
        }
    }
}

struct ToggleTimerIntent: SetValueIntent, LiveActivityIntent {
    static let title: LocalizedStringResource = "YourBrain"
    
    @Parameter(title: "Functional")
    var value: Bool
    
    func perform() throws -> some IntentResult {
        ControlManager.shared.setIsRunningValue(value)
        return .result()
    }
}

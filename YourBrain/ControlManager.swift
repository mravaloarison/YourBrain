//
//  ControlManager.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import Foundation
import WidgetKit

class ControlManager: ObservableObject {
    static let shared = ControlManager()
    
    @Published var isRunningValue: Bool = false {
        didSet {
            if oldValue != isRunningValue {
                print("Changes to isRunningValue: \(isRunningValue)")
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }
    
    @Published var goal: String = ""
    @Published var ethnicity: [String] = ["🧬 Human", "🐶 Puppy", "🧼 Soap"]
    @Published var selectedEthnicity: String = "🧼 Soap"
    
    func setGoal(_ newGoal: String) {
        goal = newGoal
    }
    
    func setSelectedEthnicity(_ newEthnicity: String) {
        if ethnicity.contains(newEthnicity) {
            selectedEthnicity = newEthnicity
        }
    }
    
    func setIsRunningValue(_ value: Bool) {
        if isRunningValue != value {
            isRunningValue = value
        }
    }
}


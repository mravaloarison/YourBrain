//
//  ControlManager.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

class ControlManager {
    static let shared = ControlManager()
    var isRunning = false
    
    func setIsRunningValue(_ value: Bool) {
        isRunning = value
    }
}

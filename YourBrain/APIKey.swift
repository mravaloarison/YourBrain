//
//  APIKey.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import Foundation

enum GeminiAPIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "Api_keys", ofType: "plist") else {
            fatalError("Couldn't find file Api_keys.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "GEMINI_API_KEY") as? String else {
            fatalError("Couldn't find key GEMINI_API_KEY")
        }
        return value
    }
}

enum GiphyAPIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "Api_keys", ofType: "plist") else {
            fatalError("Couldn't find file Api_keys.plist")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "GIPHY_API_KEY") as? String else {
            fatalError("Couldn't find key GIPHY_API_KEY")
        }
        return value
    }
}


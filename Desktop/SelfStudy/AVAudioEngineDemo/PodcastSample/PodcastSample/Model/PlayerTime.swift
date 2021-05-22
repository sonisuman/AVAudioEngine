//
//  PlayerTime.swift
//  PodcastDemo
//
//  Created by Soni Suman on 22/05/21.
//

import Foundation

struct PlayerTime {
    let elapsedText: String
    let remainingText: String
    
    static let zero: PlayerTime = .init(elapsedTime: 0, remainingTime: 0)
    
    init(elapsedTime: Double, remainingTime: Double) {
        elapsedText = PlayerTime.formatted(time: elapsedTime)
        remainingText = PlayerTime.formatted(time: remainingTime)
    }
    
    private static func formatted(time: Double) -> String {
        var seconds = Int(ceil(time))
        var hours = 0
        var mins = 0
        
        if seconds > TimeConstant.secsPerHour {
            hours = seconds / TimeConstant.secsPerHour
            seconds -= hours * TimeConstant.secsPerHour
        }
        
        if seconds > TimeConstant.secsPerMin {
            mins = seconds / TimeConstant.secsPerMin
            seconds -= mins * TimeConstant.secsPerMin
        }
        
        var formattedString = ""
        if hours > 0 {
            formattedString = "\(String(format: "%02d", hours)):"
        }
        formattedString += "\(String(format: "%02d", mins)):\(String(format: "%02d", seconds))"
        return formattedString
    }
}

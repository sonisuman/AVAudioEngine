//
//  PlaybackValue.swift
//  PodcastDemo
//
//  Created by Soni Suman on 22/05/21.
//
import Foundation

struct PlaybackValue: Identifiable {
    let value: Double
    let label: String
    
    var id: String {
        return "\(label)-\(value)"
    }
}


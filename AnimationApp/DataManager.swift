//
//  DataManager.swift.swift
//  AnimationApp
//
//  Created by Snow Lukin on 14.01.2022.
//

import Spring

class DataManager {
    
    static let shared = DataManager()
    
    let animations = Spring.AnimationPreset.allCases
    let curves = Spring.AnimationCurve.allCases
    
    private init() {}
}

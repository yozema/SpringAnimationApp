//
//  DataManager.swift
//  SpringAnimationApp
//
//  Created by Ilya Zemskov on 16.03.2023.
//

import Foundation
import SpringAnimation

final class DataSource {
    
    static let shared = DataSource()
    
    let preset = AnimationPreset.allCases
    
    let curve = AnimationPreset.allCases
    
    private init() {}
}

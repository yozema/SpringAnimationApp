//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by Ilya Zemskov on 16.03.2023.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        Preset: \(preset)
        Curve: \(curve)
        Force: \(String(format: "%.2f", force))
        Duration: \(String(format: "%.2f", duration))
        Delay: \(String(format: "%.2f", delay))
        """
    }
}

extension Animation {
    static func getAnimation() -> Animation {
        Animation(
            preset: DataSource.shared.preset.randomElement()?.rawValue ?? "pop",
            curve: DataSource.shared.curve.randomElement()?.rawValue ?? "easeIn",
            force: Double.random(in: 1.00...2.50),
            duration: Double.random(in: 1.00...3.00),
            delay: Double.random(in: 0.15...0.40)
        )
    }
}

//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Ilya Zemskov on 16.03.2023.
//

import UIKit
import SpringAnimation


enum AnimationStatus {
    case current, next
}

final class SpringAnimationViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var runButton: UIButton!
    
    private var animations: [Animation] = []
    private var animationIndex = 0
    private var runningAnimation = AnimationStatus.current
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
        setAnimationDescription()
    }
    
    @IBAction func runButtonTapped() {
        switch runningAnimation {
        case .current:
            setAnimationDescription()
            setAnimationParameters()
            animationIndex += 1
            runButton.setTitle("Run \(animations[animationIndex].preset)", for: .normal)
            runningAnimation = .next
        case .next:
            setAnimationDescription()
            setAnimationParameters()
            setAnimation()
            animationIndex -= 1
            runButton.setTitle("Run \(animations[animationIndex].preset)", for: .normal)
            runningAnimation = .current
        }
    }
    
    // MARK: - Animation description and settings
    private func setAnimation() {
        animations = []
        for _ in 0...1 {
            let animation = Animation.getAnimation()
            animations.append(animation)
        }
    }
    
    private func setAnimationDescription() {
        presetLabel.text = "Preset: \(animations[animationIndex].preset)"
        curveLabel.text = "Curve: \(animations[animationIndex].curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", animations[animationIndex].force))"
        durationLabel.text = "Duration: \(String(format: "%.2f", animations[animationIndex].duration))"
        delayLabel.text = "Delay: \(String(format: "%.2f", animations[animationIndex].delay))"
    }
    
    private func setAnimationParameters() {
        springAnimationView.animation = animations[animationIndex].preset
        springAnimationView.curve = animations[animationIndex].curve
        springAnimationView.force = animations[animationIndex].force
        springAnimationView.duration = animations[animationIndex].duration
        springAnimationView.delay = animations[animationIndex].delay
        springAnimationView.animate()
    }
}

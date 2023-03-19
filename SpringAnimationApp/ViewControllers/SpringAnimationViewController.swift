//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Ilya Zemskov on 16.03.2023.
//

import UIKit
import SpringAnimation

final class SpringAnimationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    
    private var animation = Animation.getAnimation()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimationDescription()
    }
    
    @IBAction func runButtonTapped(_ sender: UIButton) {
        setAnimationDescription()
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = animation.force
        springAnimationView.duration = animation.duration
        springAnimationView.delay = animation.delay
        springAnimationView.animate()
        animation = Animation.getAnimation()
        sender.setTitle("Run \(animation.preset)", for: .normal)
    }
    
    // MARK: - Animation description and settings
    private func setAnimationDescription() {
        animationLabel.text = animation.description
    }
}

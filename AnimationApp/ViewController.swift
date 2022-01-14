//
//  ViewController.swift
//  AnimationApp
//
//  Created by Snow Lukin on 14.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var springButton: SpringButton!
    
    @IBOutlet weak var currentPresetLabel: UILabel!
    @IBOutlet weak var currentCurveLabel: UILabel!
    @IBOutlet weak var currentForceLabel: UILabel!
    @IBOutlet weak var currentDurationLabel: UILabel!
    @IBOutlet weak var currentDelayLabel: UILabel!
    
    let animations = Spring.AnimationPreset.allCases.map({ $0.rawValue })
    var currentAnimation = Spring.AnimationPreset.allCases.first?.rawValue ?? "slideLeft"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnimation()
        getAnimationInfo()
    }

    @IBAction func runAnimation(_ sender: SpringButton) {
        
        setAnimation()
        getAnimationInfo()
    }
    
    private func updateCurrentAnimationProperty() {
        var currentIndex = animations.firstIndex(of: currentAnimation) ?? animations.startIndex - 1
        if currentIndex == animations.endIndex - 1 {
            currentIndex = animations.startIndex - 1
        }
        currentAnimation = animations[animations.index(after: currentIndex)]
    }
    
    private func setAnimation() {
        animatedView.animation = currentAnimation
        animatedView.curve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? "easyIn"
        animatedView.force = CGFloat.random(in: 1...2)
        animatedView.duration = CGFloat.random(in: 1...2)
        animatedView.delay = CGFloat.random(in: 0...0.5)
        
        animatedView.animate()
        
        springButton.animation = Spring.AnimationPreset.squeeze.rawValue
        springButton.animate()
        
        updateCurrentAnimationProperty()
        springButton.setTitle("Run \(currentAnimation)", for: .normal)
    }
    
    private func getAnimationInfo() {
        currentPresetLabel.text = animatedView.animation
        currentCurveLabel.text = animatedView.curve
        currentForceLabel.text = String(format: "%.3f", Double(animatedView.force))
        currentDurationLabel.text = String(format: "%.3f", Double(animatedView.duration))
        currentDelayLabel.text = String(format: "%.3f", Double(animatedView.delay))
    }
}


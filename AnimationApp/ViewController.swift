//
//  ViewController.swift
//  AnimationApp
//
//  Created by Snow Lukin on 14.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var animationInfoLabel: UILabel!
    
    private var animation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationInfoLabel.text = animation.description
    }

    @IBAction func runAnimation(_ sender: SpringButton) {
        
        animationInfoLabel.text = animation.description
        animatedView.animation = animation.preset
        animatedView.curve = animation.curve
        animatedView.force = animation.force
        animatedView.duration = animation.duration
        animatedView.delay = animation.delay
        animatedView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.preset)", for: .normal)
    }
}


//
//  ViewController.swift
//  Animation
//
//  Created by TrungLD on 5/20/20.
//  Copyright © 2020 TrungLD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grow: UIButton!
    @IBOutlet weak var slideIn: UIButton!
    @IBOutlet weak var fadeIn: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    var isAnimating = false
    var couter = 10
    
    var timer  = Timer()
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        
        UIView.animate( withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y - 500)
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y + 500)
        }
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect ( x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @objc func animate() {
        image.image = UIImage(named: "frame_\(couter)_delay-0.04s.gif")
               couter += 1
               if couter == 43 {
                   couter = 10
               }
    }
    @IBAction func button(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            
            button.setTitle("Start Animation", for: [])
            isAnimating = false
        } else {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop Animation", for: [])
            isAnimating = true
        
        }
        
    }
    
}


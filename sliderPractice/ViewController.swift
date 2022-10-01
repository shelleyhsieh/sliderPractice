//
//  ViewController.swift
//  sliderPractice
//
//  Created by Xie on 2022/9/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var santa: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //加入背景圖片
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 900, height: 500))
        backgroundImage.image = UIImage(named: "聖誕樹林")
        backgroundImage.contentMode = .scaleAspectFill
        //inserSubview置於最底層
        view.insertSubview(backgroundImage, at: 0)
        
        snowEmitter()
    }
    @IBAction func moveSlider(_ sender: UISlider) {
        santa.transform = CGAffineTransform.identity.translatedBy(x: -650*CGFloat(sender.value), y: -200*CGFloat(sender.value)).scaledBy(x: 1.5*CGFloat(sender.value), y: 1.5*CGFloat(sender.value))
        santa.alpha = CGFloat(sender.value * 1)
        
    }

    func snowEmitter(){
        let snowEmitterCell = CAEmitterCell()
        snowEmitterCell.contents = UIImage(named: "雪花")?.cgImage
        snowEmitterCell.birthRate = 1
        snowEmitterCell.lifetime = 15
        snowEmitterCell.scale = 0.3
        snowEmitterCell.scaleRange = 0.2
        snowEmitterCell.scaleSpeed = -0.03
        snowEmitterCell.spin = 0.5
        snowEmitterCell.spinRange = 1
        snowEmitterCell.emissionRange = CGFloat.pi
        snowEmitterCell.velocity = 100
        snowEmitterCell.yAcceleration = 30
    
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterCells = [snowEmitterCell]
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .line
        view.layer.addSublayer(snowEmitterLayer)
    }
}

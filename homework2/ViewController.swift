//
//  ViewController.swift
//  homework2
//
//  Created by Marso on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        machikoImage.image = UIImage(named: "machiko")
        //machikoImage.frame = CGRect(x: 0, y: 0, width: 300, height: 300)

    }
    @IBOutlet weak var machikoImage: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alPhaSliderLabel: UILabel!
    
    @IBAction func RandomColor(_ sender: Any) {
        let redRandom = Float.random(in: 0...255)
        let greenRandom = Float.random(in: 0...255)
        let blueRandom = Float.random(in: 0...255)
        let alphaRandom = Float.random(in: 0...1)
        
        backgroundColorSetting(redRandom, greenRandom, blueRandom, alphaRandom)
    }
    
    
    @IBAction func backgroundColorControlBySlider(_ sender: UISlider) {
        backgroundColorSetting(redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value)
    }
    
    func backgroundColorSetting(_ red:Float, _ green:Float, _ blue:Float, _ alpha:Float){
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        alphaSlider.value = alpha
        
        machikoImage.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(alphaSlider.value))
        
        redSliderLabel.text = String(format: "Red : %.2f", red)
        greenSliderLabel.text = String(format: "Green : %.2f", green)
        blueSliderLabel.text = String(format: "Blue : %.2f", blue)
        alPhaSliderLabel.text = String(format: "Alpha : %.2f", alpha)
        
        
    }
    



}


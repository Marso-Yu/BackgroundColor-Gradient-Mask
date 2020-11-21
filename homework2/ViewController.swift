//
//  ViewController.swift
//  homework2
//
//  Created by Marso on 2020/11/19.
//

import UIKit

let gradientLayer = CAGradientLayer()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        machikoImage.image = UIImage(named: "machiko")
        backgroundColorSetting(255, 255, 255, 1)
        gradientSlider.isEnabled = false

    }
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var machikoImage: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alPhaSliderLabel: UILabel!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var RandomColorButton: UIButton!
    
    
    @IBAction func gradientMode(_ sender: Any) {
        if gradientSwitch.isOn{
            machikoImage.image = UIImage(named: "machikoLine")
            backgroundColorSetting(0, 0, 0, 0)
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            RandomColorButton.isEnabled = false
            gradientSlider.isEnabled = true
        }
        else {
            machikoImage.image = UIImage(named: "machiko")
            backgroundColorSetting(255, 255, 255, 1)
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            RandomColorButton.isEnabled = true
            gradientSlider.isEnabled = false
            backgroundView.layer.sublayers?.removeAll()
            //backgroundView.layer.addSublayer(machikoImage.layer)
        }
        
    }

    @IBAction func backgroundClearButton(_ sender: Any) {
        backgroundColorSetting(255, 255, 255, 1)
    }
    
    @IBAction func backgroundGradientSlider(_ sender: UISlider) {
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.colors = [
            UIColor.red.cgColor,
            UIColor.orange.cgColor,
            UIColor.yellow.cgColor,
            UIColor.green.cgColor,
            UIColor.blue.cgColor,
            UIColor.purple.cgColor
        ]
        
        gradientLayer.locations = [
            0,
            NSNumber(value:gradientSlider.value*1),
            NSNumber(value:gradientSlider.value*2),
            NSNumber(value:gradientSlider.value*3),
            NSNumber(value:gradientSlider.value*4)
        ]
        backgroundView.mask = machikoImage
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    @IBAction func RandomColorButton(_ sender: Any) {
        let redRandom = Float.random(in: 0...255)
        let greenRandom = Float.random(in: 0...255)
        let blueRandom = Float.random(in: 0...255)
        let alphaRandom = Float.random(in: 0...1)
        backgroundColorSetting(redRandom, greenRandom, blueRandom, alphaRandom)
    }
    
    @IBAction func backgroundColorControlSlider(_ sender: UISlider) {
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
    
    func defaultColor(){
        machikoImage.backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(1))
    }
    



}


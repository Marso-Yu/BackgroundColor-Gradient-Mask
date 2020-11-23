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
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "machikoBackground"))
        ShowImageView.image = UIImage(named: "machiko")
        //backgroundColorSetting(255, 255, 255, 1)
        gradientSlider.isEnabled = false

    }
    
    let gradientLayer = CAGradientLayer()
    @IBOutlet weak var ShowUIView: UIView!
    @IBOutlet weak var ShowImageView: UIImageView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alPhaSliderLabel: UILabel!
    @IBOutlet weak var gradientSliderLabel: UILabel!
    @IBOutlet weak var ModeLabel: UILabel!
    
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var RandomColorButton: UIButton!

    
    
    @IBAction func gradientMode(_ sender: Any) {
        if gradientSwitch.isOn{
            ModeLabel.text = "Gradient Mask"
            drawMaskImage()
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            gradientSlider.isEnabled = true
        }
        else {
            ModeLabel.text = "Backgroud Color"
            ShowImageView.image = UIImage(named: "machiko")
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            gradientSlider.isEnabled = false
            
            //reset gradient & mask
            gradientLayer.removeFromSuperlayer()
            ShowUIView.mask = nil
        }
        
    }

    @IBAction func backgroundClearButton(_ sender: Any) {
        if gradientSwitch.isOn{
            gradientSlider.value = 0.2
            drawMaskImage()
        }
        else{
            backgroundColorSetting(255, 255, 255, 1)
        }
    }
    
    @IBAction func backgroundGradientSlider(_ sender: UISlider) {
        drawMaskImage()
    }
    
    @IBAction func RandomColorButton(_ sender: Any) {
        if gradientSwitch.isOn{
            //let gradientRandom = Float.random(in: 0.0...1)
            //gradientSlider.value = gradientRandom
            gradientSlider.value = Float.random(in: 0.0...1)
            drawMaskImage()
        }
        else{
            let redRandom = Float.random(in: 0...255)
            let greenRandom = Float.random(in: 0...255)
            let blueRandom = Float.random(in: 0...255)
            let alphaRandom = Float.random(in: 0...1)
            backgroundColorSetting(redRandom, greenRandom, blueRandom, alphaRandom)
        }
    }
    
    @IBAction func backgroundColorControlSlider(_ sender: UISlider) {
        backgroundColorSetting(redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value)
    }
    
    func backgroundColorSetting(_ red:Float, _ green:Float, _ blue:Float, _ alpha:Float){
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        alphaSlider.value = alpha
        
        ShowImageView.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(alphaSlider.value))
        
        redSliderLabel.text = String(format: "Red : %.2f", red)
        greenSliderLabel.text = String(format: "Green : %.2f", green)
        blueSliderLabel.text = String(format: "Blue : %.2f", blue)
        alPhaSliderLabel.text = String(format: "Alpha : %.2f", alpha)
    }
    
    func drawMaskImage(){
        gradientLayer.frame = ShowUIView.bounds
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
        
        let machikoLineView = UIImage(named: "machikoLine")
        let machikoLineImageview = UIImageView(image: machikoLineView)
        machikoLineImageview.frame.size = CGSize(width: 350, height: 350)
        ShowUIView.mask = machikoLineImageview
        ShowUIView.layer.addSublayer(gradientLayer)
    
        gradientSliderLabel.text = String(format: "Gradient : %.2f", gradientSlider.value)
    }

}


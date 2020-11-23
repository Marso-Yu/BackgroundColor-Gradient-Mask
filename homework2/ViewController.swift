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
        modeLabel.text = "Backgroud Color"
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
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var borderWidthSlider: UISlider!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alPhaSliderLabel: UILabel!
    @IBOutlet weak var gradientSliderLabel: UILabel!
    @IBOutlet weak var cornerRadiusSliderLabel: UILabel!
    @IBOutlet weak var borderSliderLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var RandomColorButton: UIButton!

    
    
    @IBAction func gradientMode(_ sender: Any) {
        if gradientSwitch.isOn{
            modeLabel.text = "Gradient Mask"
            drawMaskImage()
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            cornerRadiusSlider.isEnabled = false
            borderWidthSlider.isEnabled = false
            gradientSlider.isEnabled = true
        }
        else {
            modeLabel.text = "Backgroud Color"
            ShowImageView.image = UIImage(named: "machiko")
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            cornerRadiusSlider.isEnabled = true
            borderWidthSlider.isEnabled = true
            gradientSlider.isEnabled = false
            
            //reset gradient & mask
            gradientLayer.removeFromSuperlayer()
            ShowUIView.mask = nil
        }
        
    }

    @IBAction func ClearButton(_ sender: Any) {
        if gradientSwitch.isOn{
            gradientSlider.value = 0.2
            drawMaskImage()
        }
        else{
            backgroundSetting(255, 255, 255, 1, 0, 0)
        }
    }
    
    @IBAction func backgroundGradientSlider(_ sender: UISlider) {
        drawMaskImage()
    }
    
    @IBAction func RandomButton(_ sender: Any) {
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
            let cornerRadiusRandom = Float.random(in: 0...150)
            let borderWidthRandom = Float.random(in: 0...10)
            backgroundSetting(redRandom, greenRandom, blueRandom, alphaRandom, cornerRadiusRandom, borderWidthRandom)
        }
    }
    
    @IBAction func backgroundControlSlider(_ sender: UISlider) {
        backgroundSetting(redSlider.value, greenSlider.value, blueSlider.value, alphaSlider.value, cornerRadiusSlider.value, borderWidthSlider.value)
    }
    
    func backgroundSetting(_ red:Float, _ green:Float, _ blue:Float, _ alpha:Float, _ corner:Float, _ border:Float){
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        alphaSlider.value = alpha
        cornerRadiusSlider.value = corner
        borderWidthSlider.value = border
        
        //background Color
        ShowImageView.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(alphaSlider.value))
        
        //corner Radius
        ShowImageView.clipsToBounds = true
        ShowImageView.layer.cornerRadius = CGFloat(cornerRadiusSlider.value)
        ShowUIView.layer.cornerRadius = CGFloat(cornerRadiusSlider.value)
        
        //border Width
        ShowUIView.layer.borderColor = UIColor.systemOrange.cgColor
        ShowUIView.layer.borderWidth = CGFloat(borderWidthSlider.value)
        
        //Label Text
        redSliderLabel.text = String(format: "Red : %.2f", red)
        greenSliderLabel.text = String(format: "Green : %.2f", green)
        blueSliderLabel.text = String(format: "Blue : %.2f", blue)
        alPhaSliderLabel.text = String(format: "Alpha : %.2f", alpha)
        cornerRadiusSliderLabel.text = String(format: "Corner Radius : %.0f", corner)
        borderSliderLabel.text = String(format: "Border Width : %.0f", border)
        
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
        machikoLineImageview.frame.size = CGSize(width: 300, height: 300)
        ShowUIView.mask = machikoLineImageview
        ShowUIView.layer.addSublayer(gradientLayer)
    
        gradientSliderLabel.text = String(format: "Gradient : %.2f", gradientSlider.value)
    }

}

/* shadow
ShowUIView.layer.shadowColor = UIColor.red.cgColor
ShowUIView.layer.shadowOpacity = Float(shadowSlider.value)
ShowUIView.layer.shadowOffset = CGSize(width: 1, height: 1)
*/

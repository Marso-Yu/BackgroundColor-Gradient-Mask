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
    
    
    
    @IBAction func backgroundColor(_ sender: UISlider) {
        machikoImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
        
        redSliderLabel.text = String(format: "Red : %.2f", redSlider.value)
        greenSliderLabel.text = String(format: "Greem : %.2f", greenSlider.value)
        blueSliderLabel.text = String(format: "Blue : %.2f", blueSlider.value)
        alPhaSliderLabel.text = String(format: "Alpha : %.2f", alphaSlider.value)
    }
    
    



}


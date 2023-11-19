//
//  ViewController.swift
//  Sliders
//
//  Created by Sergey Balashow on 11/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet for custom view
    
    @IBOutlet weak var myView: UIView!
    
    // Outlets for labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    // Outlets for sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.cornerRadius = 20
        updateColor()
    }
    
    // IBActions for Sliders
    
    @IBAction func redSliderAction() {
        updateColor()
        updateLabels()
    }
    
    @IBAction func greenSliderAction() {
        updateColor()
        updateLabels()
    }
    
    @IBAction func blueSliderAction() {
        updateColor()
        updateLabels()
    }
    
    // Update color for custom view
    func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        myView.backgroundColor = color
    }
    
    // Update label values
    func updateLabels() {
            redLabel.text = String(format: "%.2f", redSlider.value)
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            blueLabel.text = String(format: "%.2f", blueSlider.value)
        }
}


//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Sergey Balashow on 11/18/23.
//
import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
   
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var viewColor: UIColor!
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    // MARK: - Origin Settings
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        // Извлекаем компоненты цвета
        viewColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Устанавливаем значения слайдерам
        redSlider.setValue(Float(red), animated: true)
        greenSlider.setValue(Float(green), animated: true)
        blueSlider.setValue(Float(blue), animated: true)
        
        updateColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
    }
    
    // MARK: - Update labels.
    @IBAction func sliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
        
        // Update color for view.
        updateColor()
    }
    
    // Convert slider value to String.
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Update color for view.
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
    }
}

struct Color {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
}
var customColor: Color!

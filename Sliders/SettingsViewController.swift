//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Sergey Balashow on 11/18/23.
//
import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorizedView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
   
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Public Properties
    var customColor: UIColor!
    weak var delegate: SettingsViewControllerDelegate?
    
    // MARK: - Private Properties
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    
    // MARK: - Override Methods
    // Origin Settings
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizedView.layer.cornerRadius = 20
        
        // Extract color components from the given color
        customColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Set values for sliders
        redSlider.setValue(Float(red), animated: true)
        greenSlider.setValue(Float(green), animated: true)
        blueSlider.setValue(Float(blue), animated: true)
        
        // Update color for view
        updateViewColor()
        
        // Update values for labels
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)        
    }
    
    // MARK: - IB Actions
    // Pass color back to MainVC
    @IBAction func doneButtonAction() {
        guard let color = colorizedView.backgroundColor else { return }
        delegate?.passData(for: color)
        dismiss(animated: true)
    }
    
    // Update labels
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
        updateViewColor()
    }
    
    // MARK: - Private Methods
    // Convert slider value to String.
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // Update color for view.
    private func updateViewColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorizedView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
    }
}

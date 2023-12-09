//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Sergey Balashov on 12/8/23.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func passData(for color: UIColor)
}

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.customColor = view.backgroundColor
        settingsVC?.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func passData(for color: UIColor) {
        view.backgroundColor = color
    }
}

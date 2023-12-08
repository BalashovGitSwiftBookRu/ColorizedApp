//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Sergey Balashov on 12/8/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.viewColor = view.backgroundColor        
    }
   

}

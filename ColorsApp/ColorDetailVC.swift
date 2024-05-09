//
//  ColorDetailVC.swift
//  ColorsApp
//
//  Created by Mohamed Farouk Ben Akacha on 18/3/2024.
//

import UIKit

class ColorDetailVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }
}

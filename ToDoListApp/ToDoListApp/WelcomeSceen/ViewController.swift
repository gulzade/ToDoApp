//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Gülzade Karataş on 1.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonStart: UIButton!
    
    @IBOutlet weak var viewBacground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBacground.layer.cornerCurve = .continuous
        viewBacground.layer.cornerRadius = 150
        buttonStart.layer.cornerRadius = 120
    }

    @IBAction func letsStart(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
}


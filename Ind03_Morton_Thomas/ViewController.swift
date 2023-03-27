//
// ViewController.swift
// Ind03_Morton_Thomas
//
// Created by Thomas Morton on 3/27/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var outlineImageView: UIImageView!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var stateAreaLabel: UILabel!
    
    
    var flagImage = UIImage()
    var outlineImage = UIImage()
    var stateName = String()
    var stateArea = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    override func viewWillAppear(_ animated: Bool) {
        //Set the outlets to the images/labels passed into the view
        flagImageView.image = flagImage
        outlineImageView.image = outlineImage
        stateNameLabel.text = stateName
        stateAreaLabel.text = stateArea
        
    }
}


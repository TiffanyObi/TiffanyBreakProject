//
//  ViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class MAINViewController: UIViewController {
    
    @IBOutlet weak var gamesButton: UIButton!
    
    @IBOutlet weak var videosButton: UIButton!
    
    @IBOutlet weak var sliderControl: UISlider!
    
    @IBOutlet weak var redbutton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    func configureSlider() {
        sliderControl.maximumValue = 1.0
        sliderControl.minimumValue = 0.0
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        videosButton.layer.cornerRadius = 20
        videosButton.clipsToBounds = true
        
        gamesButton.layer.cornerRadius = 20
        gamesButton.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatebuttonImages()
        nameTextField.delegate = self
        redbutton.layer.cornerRadius = 30
        blueButton.layer.cornerRadius = 30
        greenButton.layer.cornerRadius = 30
        
    }
    
    let redCG = 0.2
    let blueCG = 0.4
    let greenCG = 0.3
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        configureSlider()
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(greenCG), blue: CGFloat(blueCG), alpha:1.0)
        
    }
    
    func updatebuttonImages() {

        gamesButton.setBackgroundImage(UIImage(named: "gamesimage"), for: .normal
        )
        
        redbutton.backgroundColor = .red
        blueButton.backgroundColor = .blue
        greenButton.backgroundColor = .green
        videosButton.setBackgroundImage(UIImage(named: "screen-4"), for: .normal)
    }
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        
       blueButton.backgroundColor = .blue
        greenButton.backgroundColor = .green
        sender.backgroundColor = .clear
       
        blueButton.setBackgroundImage(nil, for: .normal)
        
        greenButton.setBackgroundImage(nil, for: .normal)
        sender.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(sliderControl.value), green: CGFloat(greenCG), blue: CGFloat(blueCG), alpha:1.0)
        
    }
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
       redbutton.backgroundColor = .red
        greenButton.backgroundColor = .green
       sender.backgroundColor = .clear
       redbutton.setBackgroundImage(nil, for: .normal)
        greenButton.setBackgroundImage(nil, for: .normal)
        sender.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redCG), green: CGFloat(greenCG), blue: CGFloat(sliderControl.value), alpha:1.0)
    }
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
       redbutton.backgroundColor = .red
        blueButton.backgroundColor = .blue
       sender.backgroundColor = .clear
        redbutton.setBackgroundImage(nil, for: .normal)
        blueButton.setBackgroundImage(nil, for: .normal)
        sender.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redCG), green: CGFloat(sliderControl.value), blue: CGFloat(blueCG), alpha:1.0)
    }
    
}

extension MAINViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
       
        navigationItem.title = "Welcome \(textField.text ?? "SuperHero!"), Have Fun ‼️"
         textField.text = ""
        return true
    }
}

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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updatebuttonImage()
    }
    
    

    func updatebuttonImage() {
        gamesButton.setBackgroundImage(UIImage(named: "gamesimage"), for: .normal
        )
        
        videosButton.setBackgroundImage(UIImage(named: "screen-4"), for: .normal)
    }

}


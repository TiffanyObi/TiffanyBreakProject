//
//  GAMESViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 1/3/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class GAMESViewController: UIViewController {

    @IBOutlet weak var ticTacToeButton: UIButton!
    
    @IBOutlet weak var colorMatchingButton: UIButton!
    
    @IBOutlet weak var numberGamesButton: UIButton!
    
    @IBOutlet weak var spellingGameButton: UIButton!
    
    @IBOutlet weak var drawButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateUI()
    }
    
    func updateUI() {
        
        drawButtonPressed.layer.borderWidth = 10
        
        drawButtonPressed.layer.borderColor = .init(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    

}

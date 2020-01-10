//
//  NumberMatchingViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 1/3/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class NumberGameViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var numberPictureView: UIImageView!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    var numbers: NumberNames!
    var numberImages:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func getRandomImages() -> String {
        
        numberImages = NumberNames.getNumberNames()
        
        
        print(numberImages)
        
        let randomImage = numberImages.randomElement() ?? ""
        
        return randomImage
    }

   
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        
        let randomNumberImage = getRandomImages()
        
        numberPictureView.image = UIImage(named: randomNumberImage)
        
    }
    
     

}

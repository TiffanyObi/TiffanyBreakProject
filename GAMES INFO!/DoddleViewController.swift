//
//  DoddleViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 1/8/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        for (i, p) in lines.enumerated() {
            if i == 0 {
                context.move(to: p)
            } else {
                context.addLine(to: p)
            }
        }
        context.strokePath()
    }
    
    var lines = [CGPoint]()
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {
            return
        }
      //  print(point)
        
        lines.append(point)
        
        setNeedsDisplay()
    }
}


class DoddleViewController: UIViewController {
    
let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }
    

    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        
    }
    

}

//
//  ColorsDetailVC.swift
//  ColorApp
//
//  Created by Cristian Macovei on 21.11.2022.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    
    var color: UIColor?
    @IBOutlet var colorLabel: UITextView! = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(colorLabel)
        view.backgroundColor = color ?? .blue
        
        colorLabel.frame = view.bounds
        colorLabel.textAlignment = .center
        colorLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
    
        let redValueFloat = Float(color!.cgColor.components?[0] ?? 0.0)
        let greenValueFloat = Float(color!.cgColor.components?[1] ?? 0.0)
        let blueValueFloat = Float (color!.cgColor.components?[2] ?? 0.0)
        //let alphaValueFloat = Float (color!.cgColor.components?[3] ?? 0.0)
        
        let hexString = String(format: "%02lX%02lX%02lX", lroundf(redValueFloat*255), lroundf(greenValueFloat*255), lroundf(blueValueFloat*255))
        
        colorLabel.text = """
    Hex: \(hexString)
    R: \(Int(redValueFloat*255)), G: \(Int(greenValueFloat*255)), B: \(Int(blueValueFloat*255)) 
"""
        
        if redValueFloat*255 < 100, greenValueFloat*255 < 100, blueValueFloat*255 < 100 {
            colorLabel.textColor = .white
        } else {
            colorLabel.textColor = .black
        }
        
        print(colorLabel.text!)
        
    }
    
    

}

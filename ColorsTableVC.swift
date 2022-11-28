//
//  ColorsTableVC.swift
//  ColorApp
//
//  Created by Cristian Macovei on 21.11.2022.
//

import UIKit

//Normal code for the ViewController is here
class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "cell"
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetailVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColorsInArray()
        // Do any additional setup after loading the view.
    }
    
    func addRandomColorsInArray() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ColorsDetailVC
        destinationVC.color = sender as? UIColor
        
    }
    
}

//Code for the TableView and everything in it
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }

        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let color = colors[indexPath.row]
        
        let redValueFloat = Float(color.cgColor.components![0])
        let greenValueFloat = Float(color.cgColor.components![1])
        let blueValueFloat = Float (color.cgColor.components![2])
        //let alphaValueFloat = Float (color.cgColor.components![3])
        
        
        print("R: \(redValueFloat*255), G: \(greenValueFloat*255), B: \(blueValueFloat*255)")
        
        performSegue(withIdentifier: Segues.toDetail, sender: color)
        
        let hexValue = String(format: "%02lX%02lX%02lX", lroundf(redValueFloat*255), lroundf(greenValueFloat*255), lroundf(blueValueFloat*255))
        
        print("Hex: \(hexValue)")
        
    }
    
}

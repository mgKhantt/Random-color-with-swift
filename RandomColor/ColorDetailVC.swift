//
//  ColorDetailVC.swift
//  RandomColor
//
//  Created by Khant Phone Naing  on 16/10/2024.
//

import UIKit

class ColorDetailVC: UIViewController {

    var color : UIColor?
    var colorName : String?
    
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
        colorLabel.text = colorName ?? "UnKnon Color"
        
        colorLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(copyText))
        colorLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func copyText() {
        UIPasteboard.general.string = colorLabel.text
        
        let alert = UIAlertController(title: "Copied", message: "\(colorLabel.text ?? "") copied to clipboard!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

//
//  ColorTableVC.swift
//  RandomColor
//
//  Created by Khant Phone Naing  on 16/10/2024.
//

import UIKit

class ColorTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Segue {
        static let toDetailVC = "ToColorDetail"
    }
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
}

extension ColorTableVC : UITableViewDelegate, UITableViewDataSource {
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
        let colorHex = color.toHexString()
        performSegue(withIdentifier: Segue.toDetailVC, sender: (color, colorHex))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailVC
        if let (color, colorHex) = sender as? (UIColor, String) {
            destVC.color = color
            destVC.colorName = colorHex
        }
    }
}

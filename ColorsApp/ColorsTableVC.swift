//
//  ColorsTableVC.swift
//  ColorsApp
//
//  Created by Mohamed Farouk Ben Akacha on 18/3/2024.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let ColorCell = "ColorCell"
    }
    
    enum Segues {
        static let ToColorsDetailVC = "ToColorsDetailVC"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailVC
        destVC.color = sender as? UIColor
    } 
    
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.ColorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.ToColorsDetailVC, sender: color)
    }
}

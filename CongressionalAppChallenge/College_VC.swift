//
//  College_VC.swift
//  CongressionalAppChallenge
//
//  Created by Alex Huang on 6/26/21.
//

import UIKit

class College_VC: UIViewController {

    // MARK : Bottom Task Bar Object
    lazy var Bottom_Task_Bar_View : UIView = {
        let iv = UIView()
        // MARK : Handle return to home page
        let first_item = UIButton()
        first_item.backgroundColor = UIColor.red
        first_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(first_item)
        first_item.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 5).isActive = true
        first_item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        first_item.widthAnchor.constraint(equalToConstant: 50).isActive = true
        first_item.bottomAnchor.constraint(equalTo: iv.bottomAnchor, constant: -5).isActive = true
        // MARK : Handle search
        let second_item = UIButton()
        second_item.backgroundColor = UIColor.systemYellow
        second_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(second_item)
        second_item.topAnchor.constraint(equalTo: iv.topAnchor, constant: 5).isActive = true
        second_item.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
        second_item.widthAnchor.constraint(equalToConstant: 50).isActive = true
        second_item.bottomAnchor.constraint(equalTo: iv.bottomAnchor, constant: -5).isActive = true
        // MARK : Handle bookmark
        let third_item = UIButton()
        third_item.backgroundColor = UIColor.systemGreen
        third_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(third_item)
        third_item.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -5).isActive = true
        third_item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        third_item.widthAnchor.constraint(equalToConstant: 50).isActive = true
        third_item.bottomAnchor.constraint(equalTo: iv.bottomAnchor, constant: -5).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor.lightGray
        return iv
    }()
    
    // Iteration and Selection
    public func grid_model(n : Int, m : Int) {
        var count : Int = 0
        for row in 0 ..< n {
            for col in 0 ..< m {
                count += 1
                let bt = UIButton()
                let size: CGFloat = 48
                let y_cor = CGFloat(row) * size * 1.2 + 200
                let x_cor = CGFloat(col) * size * 1.2 + 50
                bt.frame = CGRect(x: x_cor, y: y_cor, width: size, height: size)
                bt.tag = count
                
                if bt.tag % 2 == 0 {
                    bt.backgroundColor = .white
                } else {
                    bt.backgroundColor = .black
                }
                view.addSubview(bt)
            }
        }
    }
    
    // setup bottom task bar
    public func setup_Bottom_Task_Bar() {
        view.addSubview(Bottom_Task_Bar_View)
        Bottom_Task_Bar_View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        Bottom_Task_Bar_View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        Bottom_Task_Bar_View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        Bottom_Task_Bar_View.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        grid_model(n: 3, m: 2)
        setup_Bottom_Task_Bar()
    }
}

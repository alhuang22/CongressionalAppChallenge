//
//  College_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import Foundation

import UIKit


class College_VC : UIViewController {
    
    //MARK: Button Task Bar Object
    lazy var Bottom_Taskbar_View : UIView = {
        let iv = UIView()
        
        //MARK: handle back button to home page
        let home_item = UIButton()
        home_item.backgroundColor = UIColor.systemBlue
        home_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(home_item)
        home_item.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 30).isActive = true
        home_item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        home_item.widthAnchor.constraint(equalToConstant: 50).isActive = true
        home_item.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        
        //MARK: handle search
        let search_item = UIButton()
        search_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(search_item)
        search_item.backgroundColor = UIColor.systemBlue
        search_item.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
        search_item.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        
        
        
        //MARK: handle bookmark
        let bookmark_item = UIButton()
        bookmark_item.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(bookmark_item)
        bookmark_item.backgroundColor = UIColor.systemBlue
        bookmark_item.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -30).isActive = true
        bookmark_item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark_item.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark_item.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        
        
        
        iv.backgroundColor = UIColor.black
        iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
    }()
    
    
    
    public func grid_model(n: Int, m: Int){
        var count : Int = 0
        for row in 0 ..< n {
            for col in 0 ..< m {
                count+=1
                let bt = UIButton()
                let size : CGFloat = 48//width and height of the button
                let y_cor = CGFloat(row) * size * 1.2 + 150//1.2 is spacing between or margins
                let x_cor = CGFloat(col) * size * 1.2 + 50
                
                bt.frame = CGRect(x: x_cor, y: y_cor, width: size, height: size)
                bt.tag = count
                print(count)
                
                if bt.tag % 2 == 0{
                    bt.backgroundColor = .white
                }
                else{
                    bt.backgroundColor = .black
                }
                
                view.addSubview(bt)
            
            }
        }
        
        
    }
    
    
    
    
    
    
    //MARK: Setup
    public func setup_Bottom_Taskbar(){
        view.addSubview(Bottom_Taskbar_View)
        Bottom_Taskbar_View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.heightAnchor.constraint(equalToConstant: 80).isActive = true

        
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        grid_model(n: 9, m: 5)
        setup_Bottom_Taskbar()
        
    }
    
    
}


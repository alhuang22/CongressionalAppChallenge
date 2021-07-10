//
//  Task_Bar_VC.swift
//  CongressionalAppChallenge
//
//  Created by Alex Huang on 7/8/21.
//

import UIKit

class Task_Bar_VC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK : Declaring an instance of first icon's class
        let first_view = Scholarship_VC()
        let second_view = College_VC()
        
        // MARK : connect the tab bar item to each viewcontroller
        first_view.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "camera"), tag: 0)
        second_view.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        // MARK : Creating a viewcontroller list
        let list = [first_view, second_view]
        
        //assigning the array of views to the TabBarController
        viewControllers = list
    }
    
}

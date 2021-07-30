//
//  College_Detailed_VC.swift
//  test101
//
//  Created by Jonathan Chi on 7/14/21.
//

import Foundation
import UIKit

class College_Detailed_VC : UIViewController{
    
    var received_string : String?
    var receieved_image_string : String?
    var College_Data : College?
    
    lazy var Base_View1 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemBlue
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var Base_View2 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemGreen
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var college_name : UITextView = {
       let tx = UITextView()
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    //MARK: delcare a imageview to display image data from College_VC
    lazy var college_logo : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: received_string!)
        return iv
    }()
    
    lazy var undergraduates_number = model_label()
    lazy var location = model_label()
    
    func setup_Base_View1() {
        view.addSubview(scroll_view)
        
        scroll_view.addSubview(Base_View1)
        
        Base_View1.topAnchor.constraint(equalTo: scroll_view.topAnchor, constant: 60).isActive = true
        Base_View1.leadingAnchor.constraint(equalTo: scroll_view.leadingAnchor, constant: 10).isActive = true
        Base_View1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        Base_View1.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        Base_View1.addSubview(college_logo)
        Base_View1.addSubview(college_name)
        
        college_logo.topAnchor.constraint(equalTo: Base_View1.topAnchor, constant: 50).isActive = true
        college_logo.trailingAnchor.constraint(equalTo: Base_View1.trailingAnchor, constant: -50).isActive = true
        college_logo.heightAnchor.constraint(equalTo: Base_View1.heightAnchor, multiplier: 0.5).isActive = true
        college_logo.widthAnchor.constraint(equalTo: college_logo.heightAnchor, multiplier: 1).isActive = true
        
        college_name.topAnchor.constraint(equalTo: Base_View1.topAnchor, constant: 50).isActive = true
        college_name.leadingAnchor.constraint(equalTo: Base_View1.leadingAnchor, constant: 10).isActive = true
        college_name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        college_name.widthAnchor.constraint(equalTo: Base_View1.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    lazy var scroll_view : UIScrollView = {
        let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true //dismiss the indictaor by asssigning false
        sc.bounces = true
        sc.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1500)
        sc.frame = view.frame
        return sc
    }()
    
    var new_label = model_label()
    
    private func setup_UI(){
        new_label.text = received_string
        view.addSubview(scroll_view)
        scroll_view.addSubview(college_logo)
        scroll_view.addSubview(new_label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        new_label.text = received_string
        setup_Base_View1()
        //setup_UI()
        
        
        
    }
}


class model_label : UILabel{//custom button
    override init (frame: CGRect){
        super.init(frame: frame)
        self.frame = CGRect(x: 100, y: 100, width: 200, height: 48)
        self.backgroundColor = UIColor.systemYellow
        self.layer.cornerRadius = self.frame.size.width / 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

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
    
    
    //MARK: delcare a imageview to display image data from College_VC
    lazy var college_logo : UIImageView = {
       let iv = UIImageView()
        
        return iv
    }()
    
    var new_label = model_label()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        new_label.text = received_string
        view.addSubview(new_label)
        
        college_logo.image = UIImage(named: receieved_image_string ?? "blueSchool.png")//?? insurance just in case received string does not work
        college_logo.frame = CGRect(x:10, y: 300, width: view.frame.width - 20, height: view.frame.width-30)
        view.addSubview(college_logo)
        
        
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

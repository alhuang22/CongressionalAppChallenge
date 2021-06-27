import Foundation
import UIKit
 
class Home_VC : UIViewController {
    
 
    
    // MARK: Scholarship Button
    lazy var Scholar_BT : UIButton  = {
       
        let bt = UIButton(frame: .zero)
        bt.translatesAutoresizingMaskIntoConstraints = false //have to assign false
        bt.setTitle("Scholarship Information", for: .normal)
        bt.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 20)
        bt.layer.borderWidth=4
        bt.layer.cornerRadius=10
        // yellow is #ffd800 or 255 216 0
        bt.layer.borderColor = UIColor(red: 255/255, green: 216/255, blue: 0/255, alpha: 1.0).cgColor
        bt.setTitleColor(UIColor(red: 255/255, green: 216/255, blue: 0/255, alpha: 1.0), for: .normal)
        
        let imageName = "yellowScholarship"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //autolayer for image
        
        bt.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: bt.bottomAnchor, constant: -5).isActive = true;
        imageView.trailingAnchor.constraint(equalTo: bt.trailingAnchor, constant: -5).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: bt.heightAnchor, multiplier: 0.35).isActive = true
        imageView.widthAnchor.constraint(equalTo: bt.widthAnchor, multiplier: 0.2).isActive = true
        
        bt.addTarget(self, action: #selector(handle_scholarship_VC(sender:)), for: .touchUpInside)
        
        return bt
    
 
    }()
    
    lazy var College_BT : UIButton = {
        let bt = UIButton(frame: .zero)
        bt.translatesAutoresizingMaskIntoConstraints = false //have to assign false
        
        let title1 = "College Information"
        bt.setTitle("College Information", for: .normal)
        bt.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 20)
        bt.layer.borderWidth=4
        bt.layer.cornerRadius=10
        bt.layer.borderColor = UIColor.systemBlue.cgColor
        bt.setTitleColor(UIColor.systemBlue, for: .normal)
        
        
        let imageName = "blueSchool"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //autolayer for image
        
        bt.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: bt.bottomAnchor, constant: -5).isActive = true;
        imageView.trailingAnchor.constraint(equalTo: bt.trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalTo: bt.heightAnchor, multiplier: 0.35).isActive = true
        imageView.widthAnchor.constraint(equalTo: bt.widthAnchor, multiplier: 0.2).isActive = true
        
        bt.addTarget(self, action: #selector(handle_college_VC(sender:)), for: .touchUpInside)
       
        return bt
    }()
    
    
    
    
    
    //MARK : setup auto layout
    func setup_auto_layout (){
        view.addSubview(College_BT)
        
        let half_height = view.frame.height/4
        print(half_height)
        
        College_BT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -half_height).isActive = true
        College_BT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true//trailing is the right side    leading is left side
        College_BT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        College_BT.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
        
        
        view.addSubview(Scholar_BT)
        Scholar_BT.topAnchor.constraint(equalTo: view.topAnchor, constant: half_height).isActive = true
        Scholar_BT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true//trailing is the right side    leading is left side
        Scholar_BT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        Scholar_BT.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
 
    }
    
    
    
    
    
    
    
    
    //MARK : Setup IOS Element
//    func setup_Main_Buttons() {
//        view.addSubview(Scholar_BT)//view is the entire screen, add subView for button, can also add subviews to the button ie Scholar_BT.addSubView(picture)
//
//        //sets the scholarBt position to 1/2 of the phone screen's dimensions
//        let bt_1_x = view.frame.width/2
//        let bt_1_y = view.frame.height/2
//
//        Scholar_BT.center.x = bt_1_x
//        Scholar_BT.center.y = bt_1_y
//
//
//        //HW: please use variable method to handle object's position
//        //highly recommend to pratice 3-4 objects
//
//        print(Scholar_BT.center.x)
//
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setup_auto_layout()
        
        
       
 
 
        //setup_Main_Buttons()
            }
}

extension Home_VC {
    @objc func handle_scholarship_VC (sender: UIButton) {
        // create instance of scholarship_vc
        let scholar = Scholarship_VC()
        // create a present method to transport current view to scholarship vc view
        self.present(scholar, animated: true, completion: nil)
        // the first argument defines the destination view
        // completion is lambda expression in java, similar to block in C++
        
    }
    
    @objc func handle_college_VC (sender: UIButton) {
        let college = College_VC()
        
        //let nav = UINavigationController(rootViewController: college)
        
        self.present(college, animated: false) { [self] in
            // code to be executed after view transferred
            College_BT.setTitle("checked", for: .normal)
            //reset some values in previous page
        }
    }
    
}

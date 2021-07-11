//
//  College_VC.swift
//  CongressionalAppChallenge
//
//  Created by Alex Huang on 6/26/21.
//

import UIKit

class College_VC: UIViewController {
    
    let college_name_array : [String] = ["Harvard", "Stanford", "UCLA", "Berkeley", "MIT"]
    
    let college_collection_identifier = "college"
    
    // MARK : Declaration of CollectionView
    lazy var college_Collection : UICollectionView = {
        // declare an object of layout
        let layout = UICollectionViewFlowLayout()
        // declare the collection
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cl.delegate = self
        cl.dataSource = self
        cl.register(Customized_Collection_view_cell.self, forCellWithReuseIdentifier: college_collection_identifier)
        return cl
        
    }()

     //MARK : Bottom Task Bar Object
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
        //setup_Bottom_Task_Bar()
        setup_collection_view()
    }
}


extension College_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Method declarations are okay
    // No variable declarations
    public func setup_collection_view() {
        college_Collection.translatesAutoresizingMaskIntoConstraints = false
        college_Collection.backgroundColor = .clear
        view.addSubview(college_Collection)
        college_Collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        college_Collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        college_Collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        college_Collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        college_Collection.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item_size = CGSize(width: view.frame.width / 2.1, height: view.frame.width / 1.5)
        return item_size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK : number of cells in one section
        return college_name_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // define content in each cell
        let cell = college_Collection.dequeueReusableCell(withReuseIdentifier: college_collection_identifier, for: indexPath) as! Customized_Collection_view_cell
        cell.backgroundColor = .systemBlue
        cell.college_image.image = UIImage(named: "blueSchool.png")
        // MARK : in order to fetch and read element from array, first we want to use indexpath and then access row
        cell.college_name.text = college_name_array[indexPath.row]
        return cell
    }
}

class Customized_Collection_view_cell : UICollectionViewCell {
    // creating customized UIImageView
    lazy var college_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 15
        iv.backgroundColor = UIColor.systemGray
        return iv
    }()
    
    // creating customized UILabel
    lazy var college_name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.layer.cornerRadius = 10
        lb.backgroundColor = UIColor.systemRed
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(college_image)
        contentView.addSubview(college_name)
        
        let college_image_constraint = [
            college_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            college_image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            college_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            college_image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
        ]
        
        NSLayoutConstraint.activate(college_image_constraint)
        
        college_name.topAnchor.constraint(equalTo: college_image.bottomAnchor, constant: 10).isActive = true
        college_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        college_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        college_name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  College_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit

class College_VC : UIViewController{
    
    //MARK: College Array
    let college_name_array = ["Harvard", "UCLA", "Stanford", "MIT", "UCBerkeley", "John Hopkins", "Boston University", "UCI", "Princenton", "Columbia"]
    
    //MARK: Database
    let college_db_harvard = Model_DB(c_name: "Harvard", c_image: "Harvard", acc_rate: 0.04, contact_number: "989-11-1111")
    
    
    
    //MARK: Declaration of collectionview
    let college_collection_identifier = "college"
    
    
    lazy var college_collection: UICollectionView = {
       
        //declare an object of layout
        let layout = UICollectionViewFlowLayout()
        //declare the collection
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)//.zero is the 0,0 left corner
        cl.delegate = self
        cl.dataSource = self
        
        cl.register(Customized_collection_view_cell.self, forCellWithReuseIdentifier: college_collection_identifier)
        
        return cl
        
    }()
    
    
    
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
        view.backgroundColor = UIColor.black
        setup_collectionview()
        setup_Bottom_Taskbar()
    }
}



extension College_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    //MARK: Set up COLLECTION VIEW
    public func setup_collectionview(){
        
        college_collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(college_collection)
        college_collection.backgroundColor = .clear
        college_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        college_collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        college_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        college_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //creates the dimensions for each cell in the UICollection View
        let item_size = CGSize(width: view.frame.width/2.6, height: view.frame.width/2.6)
        return item_size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //creates boundaries between rows
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return college_name_array.count//nubers of cells in one section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //define the content in each cell
        let cell = college_collection.dequeueReusableCell(withReuseIdentifier: college_collection_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
        cell.backgroundColor = .systemBlue
        cell.c_image.image = UIImage(named: college_name_array[indexPath.row])
        
        // in order to fetch and read element from the array, first we want to use index path and then access row
        cell.c_name.text = college_name_array[indexPath.row]//add .row for index path
        cell.layer.cornerRadius = 10
//        cell.c_image.clipsToBounds = true //used for rounded corner for image
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let destination = College_Detailed_VC()//sets next UIView
        
        
        destination.received_string = college_name_array[indexPath.row]
        destination.receieved_image_string = college_name_array[indexPath.row]
        self.present(destination, animated: true)
        
        print(indexPath)
    }
}



//MARK: SET UP CELLS
class Customized_collection_view_cell : UICollectionViewCell {
    //MARK: Customized Image View
    lazy var c_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 15
        iv.backgroundColor = UIColor.systemGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius  = 10
        return iv
    }()
    
    //MARK: Customized UILabel
    lazy var c_name : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.layer.cornerRadius = 10
        lb.textAlignment = .right
        lb.textColor = .white
        lb.font = UIFont(name: "Georgia-Bold", size: 15)
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 10
        return lb
    }()
    
    //MARK: Customized Format for Cell
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(c_image) //cells' content
        contentView.addSubview(c_name)
        //MARK: Image Format
        let c_image_constraint = [
            c_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_image.topAnchor.constraint(equalTo: contentView.topAnchor,constant:10), c_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(c_image_constraint)
        //MARK: Label Format
        let c_name_constraint = [
            c_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_name.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant:-30), c_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(c_name_constraint)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

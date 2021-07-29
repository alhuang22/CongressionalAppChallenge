//
//  College_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit


class College_VC : UIViewController{
    var college_list = [College]() // MARK: array with all colleges
    
    //MARK: GET DATA FROM JSON FILE, 1022 colleges (degree-granting US colleges larger than 1000 students)
    
    private func getData(file_path : String) {

        guard let path = Bundle.main.path(forResource : file_path, ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf : url)//gets data from url
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)

            guard let array = json as? [Any] else {return}



            for item in array {
                guard let dictionary = item as? [String : Any] else {return}

                guard let college_name = dictionary["college_name"] as? String else {return}
                guard let address = dictionary["address"] as? String else {return}
                guard let city = dictionary["city"] as? String else {return}
                guard let state = dictionary["state"] as? String else {return}
                guard let domain = dictionary["domain"] as? String else {return}
                guard let graduation_rate = dictionary["graduation_rate"] as? Int else {return}
                guard let percent_admitted = dictionary["percent_admitted"] as? Int else {return}
                guard let tuition = dictionary["tuition"] as? Int else {return}
                guard let percent_financial_aid = dictionary["percent_finicial_aid"] as? Int else {return}
                guard let SAT_W_75_Percentile = dictionary["SAT_W_75_Percentile"] as? Int else {return}
                guard let SAT_M_75_Percentile = dictionary["SAT_M_75_Percentile"] as? Int else {return}
                guard let ACT_25_Percentile = dictionary["ACT_25_Percentile"] as? Int else {return}
                guard let ACT_75_Percentile = dictionary["ACT_75_Percentile"] as? Int else {return}
                guard let application_total = dictionary["application_total"] as? Int else {return}
                guard let total_enrollment = dictionary["enrollment"] as? Int else {return}


                DispatchQueue.main.async {
                    [weak self] in
                    self?.college_list.append(College(college_name: college_name, address: address, city: city, state: state, domain : domain,  graduation_rate: graduation_rate, percent_admitted: percent_admitted, tuition: tuition, percent_financial_aid: percent_financial_aid, SAT_W_75_Percentile: SAT_W_75_Percentile, SAT_M_75_Percentile: SAT_M_75_Percentile, ACT_25_Percentile: ACT_25_Percentile, ACT_75_Percentile: ACT_75_Percentile, application_total: application_total, total_enrollment : total_enrollment))

                }


            }

        }catch{
            print("error")
        }

    }

    
    
    //MARK: College Array
    let top_thirty = ["Princeton University", "Harvard University", "Columbia University", "Massachusetts Institute of Technology", "Yale University", "Stanford University", "University of Chicago", "University of Pennsylvania", "California Institute of Technology", "Johns Hopkins University", "Northwestern University", "Duke University", "Dartmouth College", "Brown University", "Vanderbilt University", "Rice University", "Washington University in St. Louis", "Cornell University", "University of Notre Dame", "University of California - Los Angeles", "Emory University", "University of California - Berkeley", "Georgetown University", "University of Michigan", "University of Southern California", "Carnegie Mellon University", "New York University", "Tufts University", "University of California - Santa Barbara", "University of Florida"]
    
    //MARK: Top 30 COLLEGES TITLE
    
    let college_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Top 30 US Colleges"
        bt.font = UIFont(name: "Georgia-Bold", size: 25)
        bt.textColor = .systemBlue
                
        return bt
    }()
    
    
    //MARK: DECLRATION OF THE COLLECTIONVIEW
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
        
        //MARK: handle search
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        iv.addSubview(search)
        search.backgroundColor = UIColor.systemBlue
        search.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 70).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        search.widthAnchor.constraint(equalToConstant: 50).isActive = true
        search.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        
        let searchimage = UIImage(named: "search")
        let searchimageView = UIImageView(image: searchimage!)
        searchimageView.translatesAutoresizingMaskIntoConstraints = false
        search.addSubview(searchimageView)
        searchimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        searchimageView.centerYAnchor.constraint(equalTo: search.centerYAnchor, constant: 0).isActive = true
        searchimageView.centerXAnchor.constraint(equalTo: search.centerXAnchor, constant: 0).isActive = true
        
        search.addTarget(self, action: #selector(bring_up_search_page(sender:)), for: .touchUpInside)
        
        
        
        //MARK: handle home
        let home = UIButton()
        home.translatesAutoresizingMaskIntoConstraints = false
        home.layer.cornerRadius = 10
        iv.addSubview(home)
        home.backgroundColor = UIColor.systemBlue
        home.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        home.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
        home.heightAnchor.constraint(equalToConstant: 50).isActive = true
        home.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let homeimage = UIImage(named: "home")
        let homeimageView = UIImageView(image: homeimage!)
        homeimageView.translatesAutoresizingMaskIntoConstraints = false
        home.addSubview(homeimageView)
        homeimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        homeimageView.centerYAnchor.constraint(equalTo: home.centerYAnchor, constant: 0).isActive = true
        homeimageView.centerXAnchor.constraint(equalTo: home.centerXAnchor, constant: 0).isActive = true
        home.addTarget(self, action: #selector(bring_up_home_page(sender:)), for: .touchUpInside)
        
        
        //MARK: handle bookmark
        let bookmark = UIButton()
        bookmark.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(bookmark)
        bookmark.layer.cornerRadius = 10
        bookmark.backgroundColor = UIColor.systemBlue
        bookmark.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -70).isActive = true
        bookmark.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true

        let bookmarkimage = UIImage(named: "bookmark")
        let bookmarkimageView = UIImageView(image: bookmarkimage!)
        bookmarkimageView.translatesAutoresizingMaskIntoConstraints = false
        bookmark.addSubview(bookmarkimageView)
        bookmarkimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkimageView.centerYAnchor.constraint(equalTo: bookmark.centerYAnchor, constant: 0).isActive = true
        bookmarkimageView.centerXAnchor.constraint(equalTo: bookmark.centerXAnchor, constant: 0).isActive = true
        bookmark.addTarget(self, action: #selector(bring_up_bookmark_page(sender:)), for: .touchUpInside)
        
        
        
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
        Bottom_Taskbar_View.topAnchor.constraint(equalTo: college_collection.bottomAnchor, constant: 0).isActive = true
    }
    
    public func set_up_college_label (){
        view.addSubview(college_title)
        college_title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        college_title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        college_title.bottomAnchor.constraint(equalTo: college_collection.topAnchor, constant: 0).isActive = true
        
    }
    //MARK: SET LOGO IMAGE
//    func setLogoImage(from url: String) {
//            guard let imageURL = URL(string: url) else { return }
//
//                // just not to cause a deadlock in UI!
//            DispatchQueue.global().async {
//                guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//                let image = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                               self.logoImageView.image = image
//                           }
//            }
//        }
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        setup_collectionview()
        setup_Bottom_Taskbar()
        set_up_college_label()
        //getData(file_path: "college_data")
        
    }
}



extension College_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    //MARK: Set up COLLECTION VIEW
    public func setup_collectionview(){
        
        college_collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(college_collection)
        college_collection.backgroundColor = .clear
        college_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        college_collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        college_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        college_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //creates the dimensions for each cell in the UICollection View
        let item_size = CGSize(width: view.frame.width/2.3, height: view.frame.width/2.3)
        return item_size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //creates boundaries between rows
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return top_thirty.count//nubers of cells in one section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //define the content in each cell
        let cell = college_collection.dequeueReusableCell(withReuseIdentifier: college_collection_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
        cell.backgroundColor = .systemBlue
        cell.c_image.image = UIImage(named: top_thirty[indexPath.row])
        
        // in order to fetch and read element from the array, first we want to use index path and then access row
        cell.c_name.text = top_thirty[indexPath.row]
        cell.layer.cornerRadius = 10
//        cell.c_image.clipsToBounds = true //used for rounded corner for image
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let destination = College_Detailed_VC()//sets next UIView
        
        
        destination.received_string = top_thirty[indexPath.row]
        destination.receieved_image_string = top_thirty[indexPath.row]
        destination.College_Data = college_list[indexPath.row]
        
        self.present(destination, animated: true)
        
        print(indexPath)
    }
    
    
    //MARK: HANDLE VIEW TRANSITIONS
    
    @objc func bring_up_search_page (sender: UIButton){
        
        let search = College_Search()
        //self targets Home_VC
        self.present(search, animated: true)
    }
    

    @objc func bring_up_home_page (sender: UIButton){

        dismiss(animated: true, completion: nil)
    }

    @objc func bring_up_bookmark_page (sender: UIButton){
        
        let search = College_Search()
        //self targets Home_VC
        self.present(search, animated: true)
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
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = UIFont(name: "Georgia-Bold", size: 9)
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

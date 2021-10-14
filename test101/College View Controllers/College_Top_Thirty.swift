
//
//  College_Top_Thirty.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit


class College_Top_Thirty : UIViewController{
    
    var College_Data = [College]()
    
    
    //MARK: College Array
    let top_thirty = ["Princeton University", "Harvard University", "Columbia University", "Massachusetts Institute of Technology", "Yale University", "Stanford University", "University of Chicago", "University of Pennsylvania", "California Institute of Technology", "Johns Hopkins University", "Northwestern University", "Duke University", "Dartmouth College", "Brown University", "Vanderbilt University", "Rice University", "Washington University in St. Louis", "Cornell University", "University of Notre Dame", "University of California - Los Angeles", "Emory University", "University of California - Berkeley", "Georgetown University", "University of Michigan", "Carnegie Mellon University", "University of Virginia-Main Campus", "University of Southern California", "New York University", "Tufts University", "University of California - Santa Barbara"]
    
    let top_thirtyES = ["Universidad de Princeton", "Universidad Harvard", "Universidad de Colombia", "Instituto de Tecnología de Massachusetts", "Universidad de Yale", "Universidad Stanford", "Universidad de Chicago", "Universidad de Pennsylvania", "Instituto de Tecnología de California", "Universidad Johns Hopkins", "Northwestern University", "Universidad de Duke", "Dartmouth College", "Universidad marrón", "Universidad de Vanderbilt", "Universidad de arroz", "Universidad de Washington en St. Louis", "Universidad de Cornell", "Universidad de Notre Dame", "Universidad de California, Los Angeles", "Universidad Emory", "Universidad de California, Berkeley", "Universidad de Georgetown", "Universidad de Michigan", "Universidad de Carnegie mellon", "Universidad de Virginia-Main Campus", "Universidad del Sur de California", "Universidad de Nueva York", "Universidad de Tufts", "Universidad de California - Santa Bárbara"]
        
    let top_thirtyZH = ["普林斯顿大学", "哈佛大学", "哥伦比亚大学", "麻省理工学院", "耶鲁大学", "斯坦福大学", "芝加哥大学", "宾夕法尼亚大学", "加利福尼亚州理工学院", "约翰霍普金斯大学", "西北大学", "杜克大学", "达特茅斯学院", "布朗大学", "范德比尔大学", "赖斯大学", "华盛顿大学在圣路易斯", "康奈尔大学", "巴黎圣母院大学", "加利福尼亚大学 - 洛杉矶", "埃默里大学", "加利福尼亚大学 - 伯克利", "乔治城大学", "密歇根大学", "卡内基·梅隆大学", "弗吉尼亚大学 - 主校园", "南加利福尼亚大学", "纽约大学", "塔夫茨大学", "加利福尼亚大学 - 圣巴巴拉"]
    
    let top_thirty_indices = [493, 360, 515, 367, 114, 978, 190, 743, 36, 333, 211, 590, 482, 769, 835, 867, 466, 517, 247, 51, 153, 48, 120, 401, 709, 931, 86, 535, 377, 54]
    
    //MARK: Top 30 COLLEGES TITLE
    
    let college_title : UILabel = {
            let bt = UILabel()
            bt.translatesAutoresizingMaskIntoConstraints = false
            bt.text = "US News University Rankings"
            bt.font = Style.myApp.font(for: .subtitle)
            if language == .ES {
                bt.text = "Las 30 mejores universidades de US"
                bt.font = UIFont(name: "Georgia", size: 17)
            } else if language == .ZH {
                bt.text = "美国新闻大学排名"
            }
            bt.textColor = .white
                    
            return bt
        }()
    
    lazy var app_logo : UIButton = {
        let bt = UIButton()
        let image = UIImage(named: "app_logo")
        bt.setImage(image, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(handle_dismiss(sender:)), for: .touchUpInside)
        return bt
    }()
    
    @objc func handle_dismiss(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
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
    
    
    //MARK: COLLEGE LABEL
    
    public func set_up_college_label (){
        view.addSubview(app_logo)
        app_logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        app_logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        app_logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        app_logo.heightAnchor.constraint(equalTo: app_logo.widthAnchor).isActive = true
        view.addSubview(college_title)
        if language == .ZH {
            college_title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        } else {
            college_title.leadingAnchor.constraint(equalTo: app_logo.trailingAnchor, constant: 10).isActive = true
        }
//        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        college_title.centerYAnchor.constraint(equalTo: app_logo.centerYAnchor).isActive = true
        
    }
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        get_Data(file_path: "data")
        setup_collectionview()
        set_up_college_label()
        
    }
}



extension College_Top_Thirty : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    
    func get_Data(file_path : String){
        
        guard let path = Bundle.main.path(forResource : file_path, ofType: "json") else {return}
        
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            parse(json: data)
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        do {
            let jsonColleges = try decoder.decode([College].self, from: json)
            College_Data = jsonColleges
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
        }
    }
    //MARK: Set up COLLECTION VIEW
    public func setup_collectionview(){
        
        college_collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(college_collection)
        college_collection.backgroundColor = .clear
        college_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        college_collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        college_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        college_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
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
        cell.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        cell.c_image.image = UIImage(named: top_thirty[indexPath.row])
        
        // in order to fetch and read element from the array, first we want to use index path and then access row
        cell.c_name.text = top_thirty[indexPath.row]
        if language == .ES {
            cell.c_name.text = top_thirtyES[indexPath.row]
        } else if language == .ZH {
            cell.c_name.text = top_thirtyZH[indexPath.row]
            cell.c_name.font = UIFont(name: "Georgia-Bold", size: 11)
        }
        
        cell.layer.cornerRadius = 10
        if cell.c_name.text!.count > 30 {
            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -40).isActive = true
        } else {
            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant:-30).isActive = true
        }
//        cell.c_image.clipsToBounds = true //used for rounded corner for image
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let destination = College_Detailed_VC()//sets next UIView
        print(College_Data.count)
        print(indexPath.row)
        destination.College_Data = College_Data[top_thirty_indices[indexPath.row]]
        
        destination.received_string = top_thirty[indexPath.row]
        destination.received_image_string = top_thirty[indexPath.row]
        destination.modalPresentationStyle = .fullScreen
        
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
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = UIFont(name: "Georgia-Bold", size: 9)
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        lb.clipsToBounds = true
        lb.numberOfLines = 0
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
            c_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(c_name_constraint)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

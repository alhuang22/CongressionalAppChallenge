//
//  TableView_Sample.swift
//  test101
//
//  Created by Jonathan Chi on 7/21/21.
//

import Foundation
import UIKit

class College_Search : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var college_list = [College]()
    
    private func get_Data(file_path : String){
        
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
            college_list = jsonColleges
            self.college_table_view.reloadData()
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
    
    
    
    
    
    
    let college_table_view_identifier : String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college_list.count//number of rows/tableview cells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//defines height for each row
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//styling for each cell, imports custom search cell
        let cell = college_table_view.dequeueReusableCell(withIdentifier: college_table_view_identifier, for: indexPath) as! search_customized_cell
        cell.name.text = college_list[indexPath.row].college_name
        
        
        var url_link = "https://logo.clearbit.com/"
        url_link+=college_list[indexPath.row].domain!
        
        cell.logo.downloaded(from: url_link, contentMode: .scaleAspectFit)
        
        
        
        cell.arrow.addTarget(self, action: #selector(bring_up_detailed_view(sender:)), for: .touchUpInside)
        return cell
    }
    
    lazy var college_table_view : UITableView = {
       let tb = UITableView()
        tb.register(search_customized_cell.self, forCellReuseIdentifier: college_table_view_identifier)
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    @objc func bring_up_detailed_view (sender: UITableViewCell){
        let secondVC = College_Detailed_VC()
        
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .coverVertical
        
        present(secondVC, animated: true, completion: nil)
        
    }
    
    
    func setup_table_view(){
        view.addSubview(college_table_view)
        college_table_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        college_table_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        college_table_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        college_table_view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        setup_table_view()
        get_Data(file_path: "test")
    }
    
}



//MARK: CUSTOMIZED TABLEVIEW CELL
class search_customized_cell : UITableViewCell {
    
    lazy var logo : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 5
        iv.backgroundColor = UIColor.systemGray
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: Customized UILabel
    lazy var name : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont(name: "Georgia", size: 12)
        lb.clipsToBounds = true
        return lb
    }()
    
    lazy var arrow : UIButton = {
       var bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "arrow")
        bt.setImage(image, for: .normal)
        bt.clipsToBounds = true
        return bt
    }()
    
    //MARK: Customized Format for Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "search_tableView_cell")
        contentView.addSubview(logo)
        contentView.addSubview(name)
        contentView.addSubview(arrow)
        logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        logo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 1).isActive = true
        
        name.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 60).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        arrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        arrow.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


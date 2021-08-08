//
//  Extension_College_Detailed_VC.swift
//  test101
//
//  Created by Jonathan Chi on 8/1/21.
//

import Foundation
import UIKit

extension College_Detailed_VC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//defines height for each row
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//defines number of rows
        if tableView == popular_majors_tableview{
            if !popular_majors_data_array[section].isExpanded {
                //code to be executed
                return 0
            }
            return popular_majors_data_array[section].category.count
        }
        
        if tableView == highest_earning_majors_tableview{
            if !highest_earning_majors_data_array[section].isExpanded {
                //code to be executed
                return 0
            }
            return highest_earning_majors_data_array[section].category.count
        }
        
        return 2
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//defines properties of each row (cell)
        
        if tableView == popular_majors_tableview {
           let cell = popular_majors_tableview.dequeueReusableCell(withIdentifier: "popular_majors", for: indexPath) as! college_detailed_tableview_cell
            
            //creating a new customized tableview cell because we want to add buttons and other structures
            
            let major_element = popular_majors_data_array[indexPath.section].category[indexPath.row]//row is for tableview,
            
            
            cell.detailed_text.text = major_element

            return cell
    }
        
        if tableView == highest_earning_majors_tableview {
            let cell = highest_earning_majors_tableview.dequeueReusableCell(withIdentifier: "highest_earning_majors", for: indexPath) as! college_detailed_tableview_cell

            //creating a new customized tableview cell because we want to add buttons and other structures

            let major_element = highest_earning_majors_data_array[indexPath.section].category[indexPath.row]//row is for tableview,


            cell.detailed_text.text = major_element

            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == popular_majors_tableview {
            return popular_majors_data_array.count
        }
        if tableView == highest_earning_majors_tableview {
            return highest_earning_majors_data_array.count
        }
        return 10
    }
    
    //how to implement drop down header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //create base view
        //then add drop dwn utton, title graduates to subview of baseview
        
        //return base view
        
        //if data base is finalized please try to insert data to this expandable tableview
        //change two dimensional data array
        let drop_down_button = UIButton(type: .system)
        drop_down_button.setTitle("Down", for: .normal)//initial status to be down
        drop_down_button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        drop_down_button.tag = section
        drop_down_button.setTitleColor(UIColor.white, for: .normal)
        if tableView == popular_majors_tableview{
            drop_down_button.addTarget(self, action: #selector(handle_popular_expansion), for: .touchUpInside)
        }
        if tableView == highest_earning_majors_tableview{
            drop_down_button.addTarget(self, action: #selector(handle_highest_earning_expansion), for: .touchUpInside)
        }
        //UIButton is a sublcass of UIview, this is why return a button is legit......
        return drop_down_button
    }
    
    
    
    @objc func handle_popular_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in popular_majors_data_array[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = popular_majors_data_array[section].isExpanded
        popular_majors_data_array[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            popular_majors_tableview.deleteRows(at: indexPaths, with: .fade)
        }else{
            popular_majors_tableview.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    @objc func handle_highest_earning_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in highest_earning_majors_data_array[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = highest_earning_majors_data_array[section].isExpanded
        highest_earning_majors_data_array[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            highest_earning_majors_tableview.deleteRows(at: indexPaths, with: .fade)
        }else{
            highest_earning_majors_tableview.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    
    
}


//MARK: EACH CELLS FORMAT
class college_detailed_tableview_cell : UITableViewCell{
    
    let icon_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let detailed_text : UITextView = {
       let tx = UITextView()
        tx.isUserInteractionEnabled = false
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "popular_major")
        contentView.addSubview(icon_image)
        contentView.addSubview(detailed_text)
        
        //icon layout
        icon_image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        icon_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        icon_image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        icon_image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        icon_image.widthAnchor.constraint(equalTo: icon_image.heightAnchor, multiplier: 1).isActive = true
              
        detailed_text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        detailed_text.leadingAnchor.constraint(equalTo: icon_image.trailingAnchor, constant: 10).isActive = true
        detailed_text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        detailed_text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




struct ExpandableArray{
    var isExpanded : Bool
    let category : [String]//stores the credentials, awards, and salary of each major
}

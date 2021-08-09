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
            print(college_list)
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
    
    
    //MARK: IMAGES FOR CLEARBIT.COM
    
    
    
//    public func get_logo(url : String){
//
//        guard let url_string = URL(string: url) else {return}
//
//        URLSession.shared.dataTask(with: url_string){
//            (data, res, err) in
//
//            if let data = data {//means if data exists
//                let output = String(data : data , encoding: .utf8)
//                print(output as Any)
//                print("succesful")
//            }
//        }.resume()
//
//    }
    
    
    
    
    
    let college_table_view_identifier : String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0//ten rows of tableview cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = college_table_view.dequeueReusableCell(withIdentifier: college_table_view_identifier, for: indexPath)
        cell.textLabel?.text = "example"
        
        
        let url_link = college_list[indexPath.row].domain
        
        cell.imageView?.downloaded(from: url_link ?? "Harvard", contentMode: .scaleAspectFit)
        return cell
    }
    
    lazy var college_table_view : UITableView = {
       let tb = UITableView()
        tb.register(UITableViewCell.self, forCellReuseIdentifier: college_table_view_identifier)
        tb.delegate = self
        tb.dataSource = self
        tb.frame = view.frame
        return tb
    }()
    
    func setup_table_view(){
        view.addSubview(college_table_view)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setup_table_view()
        get_Data(file_path: "test")
        print(college_list)
    }
    
}


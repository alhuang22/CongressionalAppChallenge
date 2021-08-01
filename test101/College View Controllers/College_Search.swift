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

                self.college_table_view.reloadData()
            }

        }catch{
            print("error")
        }
    }
    
    
    
    let college_table_view_identifier : String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return college_list.count//ten rows of tableview cell
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = college_table_view.dequeueReusableCell(withIdentifier: college_table_view_identifier, for: indexPath)
        cell.textLabel?.text = "example"
        
        
        //let url_link = college_list[indexPath.row].domain
        let url_link : URL = URL(string: "https://www.uab.edu")!
        cell.imageView?.downloaded(from: url_link, contentMode: .scaleAspectFit)
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


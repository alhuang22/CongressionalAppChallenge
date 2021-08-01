import Foundation
import UIKit
 
class College_Detailed_VC : UIViewController{
    
    var received_string : String?
    var received_image_string : String?
    
    var College_Data : College?
    
    
    
    //MARK: SETUP BASE VIEW 1 LABELS
    lazy var Base_View_1 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var college_logo : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .darkGray
        iv.layer.cornerRadius = 15
        iv.downloaded(from: "https://logo.clearbit.com/https://www.harvard.edu", contentMode: .scaleToFill)
        iv.clipsToBounds = true
        
        return iv
    }()
    
    lazy var college_name : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Columbia University"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var undergraduate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "47024 undergraduates"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
   
    lazy var location_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New York, NY"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var domain_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "columbia.edu"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    
    
    lazy var setting_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Urban"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var funded_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Private"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var size_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Medium"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    //MARK: SETUP BASE VIEW 1
    
    func setup_Base_View_1 (){
        view.addSubview(scroll_view)
        
        scroll_view.addSubview(Base_View_1)
        Base_View_1.topAnchor.constraint(equalTo: scroll_view.topAnchor, constant: 60).isActive = true
//        Base_View_1.leadingAnchor.constraint(equalTo: scroll_view.leadingAnchor, constant: 10).isActive = true
        Base_View_1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Base_View_1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        
        Base_View_1.addSubview(college_logo)
        college_logo.centerYAnchor.constraint(equalTo: Base_View_1.centerYAnchor).isActive = true
        college_logo.trailingAnchor.constraint(equalTo:Base_View_1.trailingAnchor, constant:0).isActive = true
        college_logo.heightAnchor.constraint(equalTo:Base_View_1.widthAnchor, multiplier: 0.45).isActive = true
        college_logo.widthAnchor.constraint(equalTo: college_logo.heightAnchor, multiplier: 1).isActive = true
        
        Base_View_1.addSubview(college_name)
        college_name.topAnchor.constraint(equalTo: Base_View_1.topAnchor, constant:40).isActive = true
        college_name.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 20).isActive = true

        Base_View_1.addSubview(undergraduate_label)
        undergraduate_label.topAnchor.constraint(equalTo: college_name.bottomAnchor, constant:10).isActive = true
        undergraduate_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 45).isActive = true
        
        let undergraduates_image = UIImage(named: "undergraduates")
        let undergraduates_image_view = UIImageView(image: undergraduates_image!)
        undergraduates_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(undergraduates_image_view)
        undergraduates_image_view.topAnchor.constraint(equalTo: college_name.bottomAnchor, constant:10).isActive = true
        undergraduates_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        undergraduates_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        undergraduates_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        Base_View_1.addSubview(location_label)
        location_label.topAnchor.constraint(equalTo: undergraduate_label.bottomAnchor, constant:10).isActive = true
        location_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 45).isActive = true
        
        let location_image = UIImage(named: "location")
        let location_image_view = UIImageView(image: location_image!)
        location_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(location_image_view)
        location_image_view.topAnchor.constraint(equalTo: undergraduate_label.bottomAnchor, constant:10).isActive = true
        location_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        location_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        location_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        Base_View_1.addSubview(domain_label)
        domain_label.topAnchor.constraint(equalTo: location_label.bottomAnchor, constant:10).isActive = true
        domain_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 20).isActive = true
        
        let domain_image = UIImage(named: "domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(domain_image_view)
        domain_image_view.topAnchor.constraint(equalTo: location_label.bottomAnchor, constant:12).isActive = true
        domain_image_view.leadingAnchor.constraint(equalTo: domain_label.trailingAnchor, constant: 5).isActive = true
        domain_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        domain_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        
        let setting_image = UIImage(named: "setting")
        let setting_image_view = UIImageView(image: setting_image!)
        setting_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(setting_image_view)
        setting_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        setting_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        setting_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        setting_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(setting_label)
        setting_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        setting_label.centerXAnchor.constraint(equalTo: setting_image_view.centerXAnchor).isActive = true
        
        let funded_image = UIImage(named: "funded")
        let funded_image_view = UIImageView(image: funded_image!)
        funded_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(funded_image_view)
        funded_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        funded_image_view.leadingAnchor.constraint(equalTo: setting_image_view.trailingAnchor, constant: 25).isActive = true
        funded_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        funded_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(funded_label)
        funded_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        funded_label.centerXAnchor.constraint(equalTo: funded_image_view.centerXAnchor).isActive = true
        
        let size_image = UIImage(named: "size")
        let size_image_view = UIImageView(image: size_image!)
        size_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(size_image_view)
        size_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        size_image_view.leadingAnchor.constraint(equalTo: funded_image_view.trailingAnchor, constant: 25).isActive = true
        size_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        size_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(size_label)
        size_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        size_label.centerXAnchor.constraint(equalTo: size_image_view.centerXAnchor).isActive = true
    }
    
    //MARK: -------------------------------------------------------------
    //MARK: -------------------------------------------------------------
    
    
    
    //MARK: BASE VIEW 2 LABELS
    
    lazy var Base_View_2 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var overview_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var acceptance_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acceptance Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var acceptance_rate_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5%"
        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var graduation_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Graduation Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var graduation_rate_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "97%"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var retention_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Retention Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var retention_rate_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99%"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    
    //MARK: TEST SCORE LABELS
    
    lazy var sat_range_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Range:"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var sat_range_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1500-1600"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var sat_reading_writing_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Reading/Writing"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var sat_reading_writing_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "770-800%"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var sat_math_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Math"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var sat_math_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "770-800"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    
    
    //MARK: SET UP BASE VIEW 2
    func setup_Base_View_2 (){
        scroll_view.addSubview(Base_View_2)
        Base_View_2.topAnchor.constraint(equalTo: Base_View_1.bottomAnchor, constant: 15).isActive = true
        Base_View_2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Base_View_2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.66).isActive = true
        
        Base_View_2.addSubview(overview_label)
        overview_label.topAnchor.constraint(equalTo: Base_View_2.topAnchor, constant: 20).isActive = true
        overview_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        
        Base_View_2.addSubview(acceptance_rate_label)
        acceptance_rate_label.topAnchor.constraint(equalTo: overview_label.bottomAnchor, constant: 5).isActive = true
        acceptance_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(acceptance_rate_number_label)
        acceptance_rate_number_label.topAnchor.constraint(equalTo: acceptance_rate_label.bottomAnchor, constant: 3).isActive = true
        acceptance_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        
        Base_View_2.addSubview(graduation_rate_label)
        graduation_rate_label.topAnchor.constraint(equalTo: acceptance_rate_number_label.bottomAnchor, constant: 15).isActive = true
        graduation_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(graduation_rate_number_label)
        graduation_rate_number_label.topAnchor.constraint(equalTo: graduation_rate_label.bottomAnchor, constant: 3).isActive = true
        graduation_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        
        Base_View_2.addSubview(retention_rate_label)
        retention_rate_label.topAnchor.constraint(equalTo: graduation_rate_number_label.bottomAnchor, constant: 15).isActive = true
        retention_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(retention_rate_number_label)
        retention_rate_number_label.topAnchor.constraint(equalTo: retention_rate_label.bottomAnchor, constant: 3).isActive = true
        retention_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
    }
    
    
    lazy var scroll_view : UIScrollView = {
       let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true // dismiss the indicator by assigning false
        sc.bounces = true
        sc.frame = view.frame//this is all good, no need for auto layout
        sc.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1500)
        return sc
    }()
    
   
    
    private func setup_UI() {
        view.addSubview(scroll_view) // we will add everything on the scroll_view instead of view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        
        setup_UI()
        setup_Base_View_1()
        setup_Base_View_2()
    
    }
}
 

//MARK: STYLING FOR PAGE

class Style {
    enum TextStyle {
        
        case title
        case subtitle
        case subsubtitle
        case information
    }

    struct TextAttributes {
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?

        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }

    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
}

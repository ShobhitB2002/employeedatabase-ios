
import UIKit
import CoreData

class FullDetailsOfEmployeeViewController: UIViewController {
      
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var industryLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    
    var employeeFirstName = String()
    var employeeLastName = String()
    var employeePhone = String()
    var employeeRating = String()
    var employeeEmail = String()
    var employeeIndustry = String()
    var employeeTitle = String()
    var fullEmpDict = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      firstNameLbl.text = employeeFirstName
      ratingLbl.text = employeeRating
      industryLbl.text = employeeIndustry
      phoneLbl.text = employeePhone
      emailLbl.text = employeeEmail
      titleLabel.text = employeeTitle
      lastNameLbl.text = employeeLastName
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

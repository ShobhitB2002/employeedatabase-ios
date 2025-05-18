
import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dbLayer = DBLayer.DB_Layer
        dbLayer.fetchDataAndSaveToCoreData()
    }

    @IBAction func fetchEmployeesDataBtn(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmployeesDataViewController") as! EmployeesDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


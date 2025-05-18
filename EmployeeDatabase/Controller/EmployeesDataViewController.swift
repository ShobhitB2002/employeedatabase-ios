
import UIKit
import CoreData

class EmployeesDataViewController: UIViewController{

    @IBOutlet weak var searchDataTf: UITextField!
    @IBOutlet weak var employeesDataTableView: UITableView!
    
    var empDict = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegateDatasource()
        fetchDataFromCoreData()
        searchDataTf.text = ""
    }
    
    func filterEmployees(withSearchText searchText: String?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        
        if let searchText = searchText, !searchText.isEmpty {
            // Filter by the first letter of the first name if search text is provided
            let firstLetter = String(searchText.prefix(1)).uppercased()
            let predicate = NSPredicate(format: "first_Name BEGINSWITH[cd] %@", firstLetter)
            fetchRequest.predicate = predicate
        }
        
        do {
            // Fetch data from Core Data based on the predicate
            empDict = try context.fetch(fetchRequest)
            
            // Process the filtered employees
            for employee in empDict {
                print("First Name: \(employee.first_Name), Last Name: \(employee.last_Name), Rating: \(employee.rating)")
            }
            employeesDataTableView.reloadData()
        } catch {
            print("Error fetching data from Core Data: \(error.localizedDescription)")
        }
    }

    func fetchDataFromCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        
        do {
            // Fetch data from Core Data
            empDict = try context.fetch(fetchRequest)
        }catch {
            print("Error fetching data from Core Data: \(error.localizedDescription)")
        }
    }
    
    func setTableViewDelegateDatasource(){
        searchDataTf.delegate = self
        employeesDataTableView.delegate = self
        employeesDataTableView.dataSource = self
        employeesDataTableView.register(UINib(nibName: "NamesTableCell", bundle: nil), forCellReuseIdentifier: "NamesTableCell")
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
}

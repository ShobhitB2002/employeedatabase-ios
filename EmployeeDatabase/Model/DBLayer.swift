
import Foundation
import UIKit
import CoreData

class DBLayer: NSObject{
    static let DB_Layer = DBLayer()
    
    // Fetch data from the API and save it into CoreData
    func fetchDataAndSaveToCoreData() {
        guard let url = URL(string: "https://retoolapi.dev/ayh4KB/data") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                        print("Failed to parse JSON data")
                        return
                    }
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let context = appDelegate.persistentContainer.viewContext
                    
                    // Check if CoreData is empty
                    let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
                    let isEmpty = try context.fetch(fetchRequest).isEmpty
                    
                    // If CoreData is not empty, delete existing data
                    if !isEmpty {
                        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
                        try context.execute(deleteRequest)
                    }
                    
                    // Insert new data
                    for object in jsonObject {
                        // Ensure that none of the essential fields are empty
                        guard let email = object["Email"] as? String,
                              let firstName = object["First Name"] as? String,
                              let lastName = object["Last Name"] as? String,
                              let industry = object["Industry"] as? String,
                              let jobTitle = object["Title"] as? String,
                              let phoneNumber = object["Ph. Number"] as? String,
                              let rating = object["Rating"] as? String else {
                            print("Skipping employee due to missing essential fields")
                            continue
                        }
                        
                        // Create a new Employee object
                        let newEmployee = Employee(context: context)
                        newEmployee.email_address = email
                        newEmployee.first_Name = firstName
                        newEmployee.last_Name = lastName
                        newEmployee.industry = industry
                        newEmployee.job_title = jobTitle
                        newEmployee.phone_number = phoneNumber
                        newEmployee.rating = rating
                    }
                    
                    appDelegate.saveContext()
                    print("Data saved to CoreData")
                } catch {
                    print("Error parsing JSON data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

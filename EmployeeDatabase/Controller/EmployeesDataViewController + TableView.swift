//
//  EmployeesDataViewController + TableView.swift
//  EmployeeDatabase
//
//  Created by Zeena on 17/04/24.
//

import Foundation
import CoreData
import UIKit


extension EmployeesDataViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NamesTableCell", for: indexPath)  as! NamesTableCell
        cell.nameLbl.text = empDict[indexPath.row].first_Name + " " + empDict[indexPath.row].last_Name
        cell.titleLabel.text = empDict[indexPath.row].industry
          return cell
         
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullDetailsOfEmployeeViewController") as! FullDetailsOfEmployeeViewController
        vc.employeeFirstName = empDict[indexPath.row].first_Name
        vc.employeeLastName = empDict[indexPath.row].last_Name
        vc.employeePhone = empDict[indexPath.row].phone_number
        vc.employeeRating = empDict[indexPath.row].rating
        vc.employeeEmail = empDict[indexPath.row].email_address
        vc.employeeIndustry = empDict[indexPath.row].industry
        vc.employeeTitle = empDict[indexPath.row].job_title
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension EmployeesDataViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            //let url = "https://api-generator.retool.com/IxiSqf/data?First Name=value"
            filterEmployees(withSearchText: updatedText)
        }
        return true
    }
}


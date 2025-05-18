//
//  Employee+CoreDataProperties.swift
//  EmployeeDatabase
//
//  Created by Zeena on 17/04/24.
//

import Foundation
import CoreData

extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

}

extension Employee : Identifiable {

}

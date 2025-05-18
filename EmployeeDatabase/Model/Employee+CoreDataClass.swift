//
//  Employee+CoreDataClass.swift
//  EmployeeDatabase
//
//  Created by Zeena on 17/04/24.
//

import Foundation
import CoreData

@objc(Employee)
public class Employee: NSManagedObject {
    @NSManaged var email_address: String
    @NSManaged var first_Name: String
    @NSManaged var industry: String
    @NSManaged var job_title: String
    @NSManaged var last_Name: String
    @NSManaged var phone_number: String
    @NSManaged var rating: String
}

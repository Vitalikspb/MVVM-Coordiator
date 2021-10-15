//
//  Employee.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation

// модель для данных из API сервера
struct Employee: Decodable {
    let status: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id, employeeSalary, employeeAge: Int
    let employeeName: String
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

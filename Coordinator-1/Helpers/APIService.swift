//
//  APIService.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation


class APIService: NSObject {
    
    // наш сервер
    private let sourceURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
    
    // получение данных
    func apiGetEmployeeData(completion: @escaping (Employee)->()) {
        guard let url = sourceURL else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error)
                return
            }
            if let data = data {
                do {
                    let empData = try JSONDecoder().decode(Employee.self, from: data)
                    completion(empData)
                }
                catch {
                    print(error)
                }
            }
        }.resume()
    }
}

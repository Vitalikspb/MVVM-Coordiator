//
//  EmployeeViewModel.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation

class EmployeeViewModel: NSObject {

    // для работы с сервером
    private var apiService: APIService!
    
    // для передачи данных в след контроллер
    var selectedIndex = 0
    
    // данные модели
    private(set) var empData: Employee! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    // биндинг для обновления таблицы
    var bindEmployeeViewModelToController: (() -> Void) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiGetEmployeeData { (data) in
            self.empData = data
        }
    }
    // обращаемся к дочернему координатору для открытия нового контроллера
    func showBuyVC(coordinator: MainCoorinator?) {
        coordinator?.buySubscription(to: selectedIndex)
    }
}

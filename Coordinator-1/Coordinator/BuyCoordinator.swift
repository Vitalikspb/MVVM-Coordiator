//
//  BuyCoordinator.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation
import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoorinator?
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController
    
    // создаем ViewModel для передачи данных
    var selectedProduct = EmployeeViewModel()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // открываем экран BuyVC
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        vc.buyViewModel.selectedIndex = selectedProduct.selectedIndex
        navigationController.pushViewController(vc, animated: true)
    }
}

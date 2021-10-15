//
//  MainCoorinator.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation
import UIKit

class MainCoorinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // стар для главного координатора
    func start() {
        navigationController.delegate = self
        
        // инициализация VC как первого экрана
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // создаем дочерний координатор в нем по start открываем BuyVC
    func buySubscription(to productType: Int = 0) {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.selectedProduct.selectedIndex = productType
        childCoordinators.append(child)
        child.start()
    }
    
    // создаем AccountVC
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // Удаляем последний координатор из стека childCoordinators
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    // контролируем какие координаторы необходимо удалить из памяти когда они не нужны/закрыты
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
    
}

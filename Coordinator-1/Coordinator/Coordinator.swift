//
//  Coordinator.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

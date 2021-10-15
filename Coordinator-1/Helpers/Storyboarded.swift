//
//  Storyboarded.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}
// Хелпер для работы с ViewController'ами из сториборда
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}

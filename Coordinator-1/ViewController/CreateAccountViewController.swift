//
//  CreateAccountViewController.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import UIKit

// для примера без дочернего координатора
// на данный контроллер попадаем из главного координатора
class CreateAccountViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoorinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

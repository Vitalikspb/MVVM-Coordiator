//
//  BuyViewController.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var textLabel: UILabel!
    
    // // ViewModel данных
    var buyViewModel = BuyViewModel()
    
    // ссылка на дочерний координатор
    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUpdate()
    }
    
    // обновление UI
    func UIUpdate() {
        self.textLabel.text = "\(buyViewModel.selectedIndex)"
    }
    
}

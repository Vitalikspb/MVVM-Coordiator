//
//  EmployeeTableViewCell.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    var employee: EmployeeData? {
        didSet {
            self.employeeIdLabel.text = "\(employee?.id)"
            self.employeeNameLabel.text = employee?.employeeName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

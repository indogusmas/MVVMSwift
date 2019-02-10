//
//  CellStudentList.swift
//  MVVMSwift
//
//  Created by indo gusmas arung samudra on 10/02/19.
//  Copyright © 2019 indo gusmas arung samudra. All rights reserved.
//

import UIKit

class CellStudentList: UITableViewCell {

   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addres: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var studentObj: Student?{
        didSet{
            cellDataSet()
        }
    }
    func cellDataSet() {
        name.text = studentObj?.name
        addres.text = studentObj?.addres
    }
}

//
//  TransactionListTableViewCell.swift
//  PayDayBank
//
//  Created by Banksy on 18.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class TransactionListTableViewCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

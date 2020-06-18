//
//  TransactionTableViewCell.swift
//  PayDayBank
//
//  Created by Banksy on 18.06.2020.
//  Copyright © 2020 Kaan YILDIRIM. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

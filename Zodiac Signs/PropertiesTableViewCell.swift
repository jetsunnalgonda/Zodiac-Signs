//
//  PropertiesTableViewCell.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/14/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

class PropertiesTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var property: UILabel!
    @IBOutlet weak var detailProperty: UILabel!
    
    @IBOutlet weak var propertyWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        setNeedsUpdateConstraints()
    }
    override func updateConstraints() {
        super.updateConstraints()
        propertyWidthConstraint.constant = super.frame.size.width / 3
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

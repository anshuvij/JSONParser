//
//  JSONViewCell.swift
//  JsonParsing
//
//  Created by Mobile Apps Team on 2/6/21.
//

import UIKit

class JSONViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var body: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

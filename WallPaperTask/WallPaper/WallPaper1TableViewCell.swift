//
//  WallPaper1TableViewCell.swift
//  壁紙タスクン
//
//  Created by 築山朋紀 on 2018/10/06.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit

class WallPaper1TableViewCell: UITableViewCell {
	
	let CheckBox = UILabel()
	let label = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		CheckBox.layer.borderColor = UIColor.white.cgColor
		CheckBox.layer.borderWidth = 2.5
		CheckBox.backgroundColor = UIColor(hex: "174E49")
		CheckBox.layer.cornerRadius = 5
		contentView.addSubview(CheckBox)
		
		label.textColor = UIColor.white
		label.textAlignment = NSTextAlignment.left
		label.font = UIFont.systemFont(ofSize: 22)
		contentView.addSubview(label)
		
		contentView.backgroundColor = UIColor(hex: "174E49")
		backgroundColor = UIColor(hex: "174E49")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		CheckBox.frame = CGRect(x: frame.width / 10, y: 15, width: 25, height: 25)
		label.frame = CGRect(x: CheckBox.frame.maxX + 10, y: 15, width: frame.width - (CheckBox.frame.maxX + 10), height: 25)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
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

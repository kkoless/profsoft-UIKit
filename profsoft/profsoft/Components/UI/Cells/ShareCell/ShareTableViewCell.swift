//
//  ShareTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class ShareTableViewCell: UITableViewCell, NibReusable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var shareLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
}


private extension ShareTableViewCell {

	func configureUI() {
		configureShareLabel()
	}
	
	func configureShareLabel() {
		let underlineAttriString = NSAttributedString(string: "поделиться",
													  attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
		
		shareLabel.textColor = .black
		shareLabel.attributedText = underlineAttriString
		shareLabel.font = UIFont(name: "Golos", size: 15)
	}

}

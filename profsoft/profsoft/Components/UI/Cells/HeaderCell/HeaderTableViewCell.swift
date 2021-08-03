//
//  HeaderTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class HeaderTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var userImageView: UIImageView!
	@IBOutlet weak var userInfoLabel: UILabel!
	@IBOutlet weak var userEmailLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		configureUI()
    }

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}

	func configureCell(with model: HeaderCellModelProtocol) {
		disposeBag = DisposeBag()

		backgroundColor = UIColor.init(red: 0.28, green: 0.28, blue: 0.28, alpha: 1)

		userInfoLabel.text = model.userInfo
		userEmailLabel.text = model.userEmail
		
	}
    
}


private extension HeaderTableViewCell {

	func configureUI() {
		configureImageView()
		configureUserInfoLabel()
		configureUserEmailLabel()
	}

	func configureImageView() {
		userImageView.image = UIImage(named: "userImage")
	}

	func configureUserInfoLabel() {
		userInfoLabel.font = UIFont.boldSystemFont(ofSize: 18)
		userInfoLabel.textColor = .white
		
		userInfoLabel.numberOfLines = 0
		userInfoLabel.lineBreakMode = .byWordWrapping
		userInfoLabel.sizeToFit()
		
		
	}
	
	
	func configureUserEmailLabel() {
		userEmailLabel.font = userEmailLabel.font.withSize(15)
		userEmailLabel.textColor = .white
	}
}

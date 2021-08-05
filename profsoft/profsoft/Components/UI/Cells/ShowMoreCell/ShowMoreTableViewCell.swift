//
//  ShowMoreTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class ShowMoreTableViewCell: UITableViewCell, NibReusable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var showMoreButton: UIButton!
	@IBOutlet weak var separationLineImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
}


private extension ShowMoreTableViewCell {

	func configureUI() {
		self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16)
		configureShowMoreButton()
		configureSeparationLineImageView()
	}


	func configureShowMoreButton() {
		showMoreButton.setImage(UIImage(named: "arrowIcon"), for: .normal)
		showMoreButton.setTitle("", for: .normal)
		showMoreButton.tintColor = .lightGray
	}
	
	func configureSeparationLineImageView() {
		separationLineImageView.image = UIImage(named: "separationLine")
		separationLineImageView.contentMode = .scaleAspectFill
	}

}

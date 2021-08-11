//
//  ShowLessTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//


import UIKit
import RxSwift
import RxCocoa
import Reusable

class ShowLessTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	

	@IBOutlet weak var showLessButton: UIButton!
	@IBOutlet weak var separationLineImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
	func configureCell(with model: ShowLessCellModelProtocol) {
		disposeBag = DisposeBag()
		
		showLessButton.rx.tap
			.bind(to: model.tapToLess)
			.disposed(by: disposeBag)
		
	}
	
}


private extension ShowLessTableViewCell {

	func configureUI() {
		self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16)
		configureShowLessButton()
		configureSeparationLineImageView()
	}


	func configureShowLessButton() {
		showLessButton.setImage(UIImage(named: "arrowUpIcon"), for: .normal)
		showLessButton.setTitle("", for: .normal)
		showLessButton.tintColor = .lightGray
	}
	
	func configureSeparationLineImageView() {
		separationLineImageView.image = UIImage(named: "separationLine")
		separationLineImageView.contentMode = .scaleAspectFill
	}

}

//
//  StudyTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//


import UIKit
import RxSwift
import RxCocoa

class StudyTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var studyDescriptionLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: StudyCellModelProtocol) {
		disposeBag = DisposeBag()
		
		studyDescriptionLabel.text = model.studyDiscription
		
	}
	
}


private extension StudyTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureDirectionNameLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureDirectionNameLabel() {
		studyDescriptionLabel.textColor = .black
		studyDescriptionLabel.font = UIFont(name: "Golos", size: 15)
		
		studyDescriptionLabel.numberOfLines = 0
		studyDescriptionLabel.lineBreakMode = .byWordWrapping
		studyDescriptionLabel.sizeToFit()
	}
}

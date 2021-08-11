//
//  EducationFormTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class EducationFormTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var educationNameLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: EducationFormCellModelProtocol) {
		disposeBag = DisposeBag()
		
		educationNameLabel.text = model.educationName
		
	}
	
}


private extension EducationFormTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureDirectionNameLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureDirectionNameLabel() {
		educationNameLabel.textColor = .black
		educationNameLabel.font = UIFont(name: "Golos", size: 15)
	}
}

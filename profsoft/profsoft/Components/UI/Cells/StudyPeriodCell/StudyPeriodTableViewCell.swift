//
//  StudyPeriodTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class StudyPeriodTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var studyPeriodLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: StudyPeriodCellModelProtocol) {
		disposeBag = DisposeBag()
		
		studyPeriodLabel.text = "\(model.startPeriod)-\(model.endPeriod)"
		
	}
	
}


private extension StudyPeriodTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureDirectionNameLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureDirectionNameLabel() {
		studyPeriodLabel.textColor = .black
		studyPeriodLabel.font = UIFont(name: "Golos", size: 15)
	}
}

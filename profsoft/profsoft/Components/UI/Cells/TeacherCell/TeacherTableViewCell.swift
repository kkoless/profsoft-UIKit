//
//  TeacherTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 06.08.2021.
//


import UIKit
import RxSwift
import RxCocoa

class TeacherTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var teacherLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: TeacherCellModelProtocol) {
		disposeBag = DisposeBag()
		
		teacherLabel.text = model.teacherName
		
	}
	
}


private extension TeacherTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureDirectionNameLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureDirectionNameLabel() {
		teacherLabel.textColor = .black
		teacherLabel.font = UIFont(name: "Golos", size: 15)
		
		teacherLabel.numberOfLines = 0
		teacherLabel.lineBreakMode = .byWordWrapping
		teacherLabel.sizeToFit()
	}
}

//
//  DirectionTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 05.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class DirectionTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var directionNameLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: DirectionCellModelProtocol) {
		disposeBag = DisposeBag()
		
		directionNameLabel.text = model.directionName
		
	}
	
}


private extension DirectionTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureDirectionNameLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureDirectionNameLabel() {
		directionNameLabel.textColor = .black
		directionNameLabel.font = UIFont(name: "Golos", size: 15)
	}
}

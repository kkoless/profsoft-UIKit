//
//  SectionCourcesTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 04.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class SectionCourcesTableViewCell: UITableViewCell, NibReusable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var sectionNameLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
}


private extension SectionCourcesTableViewCell {

	func configureUI() {
		configureTitleLabel()
	}


	func configureTitleLabel() {
		sectionNameLabel.text = "МОИ КУРСЫ"
		sectionNameLabel.textColor = .black
		sectionNameLabel.font = UIFont(name: "Golos", size: 15)
	}

}

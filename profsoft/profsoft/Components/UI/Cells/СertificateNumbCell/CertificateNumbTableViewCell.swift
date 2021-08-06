//
//  CertificateTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 03.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class CertificateNumbTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var certificateIdLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}


	func configureCell(with model: CertificateNumbCellModelProtocol) {
		disposeBag = DisposeBag()
		
		certificateIdLabel.text = model.certificateId
		
	}
	
}


private extension CertificateNumbTableViewCell {

	func configureUI() {
		configureTitleLabel()
		configureCertificateIdLabel()
	}


	func configureTitleLabel() {
		titleLabel.textColor = .gray
		titleLabel.font = UIFont(name: "Golos", size: 15)
	}
	
	
	func configureCertificateIdLabel() {
		certificateIdLabel.textColor = .black
		certificateIdLabel.font = UIFont(name: "Golos", size: 15)
	}
}

//
//  CertificateTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 07.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class CertificateTableViewCell: UITableViewCell, NibReusable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet weak var certificateImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configureUI()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}
	
}


private extension CertificateTableViewCell {

	func configureUI() {
		configureImageView()
	}
	
	func configureImageView() {
		certificateImageView.image = UIImage(named: "certificate")
		certificateImageView.contentMode = .scaleAspectFill
		certificateImageView.layer.cornerRadius = 10
		certificateImageView.clipsToBounds = true
	}

}


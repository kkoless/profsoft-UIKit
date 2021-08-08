//
//  HeaderTableViewCell.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class HeaderTableViewCell: UITableViewCell, CellConfigurable {
	
	private var disposeBag = DisposeBag()
	
	@IBOutlet private weak var userImageButton: UIButton!
	@IBOutlet private weak var userInfoLabel: UILabel!
	@IBOutlet private weak var userEmailLabel: UILabel!
	
	private var imagePick: UIView {
		let imagePick = UIView(frame: CGRect(x: 0, y: 0, width: userImageButton.frame.width, height: userImageButton.frame.height))
		
		imagePick.layer.cornerRadius = 10
		imagePick.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.77)
		
		let pick = UIImageView(image: UIImage(named: "imagePick"))
		pick.center = CGPoint(x: imagePick.bounds.midX,
							  y: imagePick.bounds.midY)
		
		imagePick.addSubview(pick)
		imagePick.tag = 100
		
		return imagePick
	}
	
	
	@IBAction func imageTapped(_ sender: UIButton) {
		userImageButton.addSubview(imagePick)
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
		configureUI()
    }

	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
	}

	func configureCell(with model: HeaderCellModelProtocol) {
		disposeBag = DisposeBag()

		backgroundColor = UIColor.init(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
		
		userImageButton.rx.tap
			.bind(to: model.imageTap)
			.disposed(by: disposeBag)
		
		userImageButton.viewWithTag(100)?.removeFromSuperview()
		userImageButton.setBackgroundImage(model.userImage, for: .normal)
		userInfoLabel.text = model.userInfo
		userEmailLabel.text = model.userEmail

	}
    
}

extension HeaderTableViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
}



private extension HeaderTableViewCell {

	func configureUI() {
		configureImageButton()
		configureUserInfoLabel()
		configureUserEmailLabel()
	}

	func configureImageButton() {
		userImageButton.setTitle("", for: .normal)
		userImageButton.setBackgroundImage(UIImage(named: "userImage"), for: .normal)
		userImageButton.layer.cornerRadius = 10
		userImageButton.layer.masksToBounds = true
		userImageButton.contentMode = .scaleAspectFit
	}

	func configureUserInfoLabel() {
		userInfoLabel.font = UIFont(name: "Golos", size: 15)
		userInfoLabel.textColor = .white
		
		userInfoLabel.numberOfLines = 0
		userInfoLabel.lineBreakMode = .byWordWrapping
		userInfoLabel.sizeToFit()
	}
	
	
	func configureUserEmailLabel() {
		userEmailLabel.font = UIFont(name: "Golos", size: 12)
		userEmailLabel.textColor = .white
	}
}

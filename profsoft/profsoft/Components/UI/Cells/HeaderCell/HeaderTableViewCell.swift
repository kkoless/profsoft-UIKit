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
	
	@IBOutlet weak var userImageButton: UIButton!
	@IBOutlet weak var userInfoLabel: UILabel!
	@IBOutlet weak var userEmailLabel: UILabel!
	
	@IBAction func imageTapped(_ sender: UIButton) {
		let imagePick = UIView(frame: CGRect(x: 0, y: 0, width: userImageButton.frame.width, height: userImageButton.frame.height))
		imagePick.layer.cornerRadius = 10
		imagePick.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.77)
		
		let pick = UIImageView(image: UIImage(named: "imagePick"))
		pick.center = CGPoint(x: imagePick.bounds.midX,
							  y: imagePick.bounds.midY)
		
		imagePick.addSubview(pick)

		userImageButton.addSubview(imagePick)
	}
	
	
	private lazy var imagePicker: UIImagePickerController = {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		return imagePicker
	}()
	
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

//
//  LoginScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 28.07.2021.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa


class LoginScreenViewController: UIViewController, StoryboardBased {
	
	private let disposeBag = DisposeBag()

	
	@IBOutlet weak var enterButton: UIButton!
	@IBOutlet weak var forgotPasswordLabel: UILabel!
	
	@IBOutlet weak var passwordTextField: UITextField!{
		didSet{
			guard let field = self.passwordTextField else { return }
			field.placeholder = "Пароль"
			field.isSecureTextEntry = true
			
		}
	}
	@IBOutlet weak var emailTextField: UITextField!{
		didSet{
			guard let field = self.emailTextField else { return }
			field.placeholder = "Email"
		}
	}
	
	@IBOutlet weak var companyLabel: UILabel!
	
	private var input: LoginScreenViewModelInputProtocol!
	private var output: LoginScreenViewModelOutputProtocol!
	private var viewModel: LoginScreenViewModelProtocol!
	
	private let onAppear = PublishRelay<Void>()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureUI()
		bindUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		onAppear.accept(())
	}
	
	func inject(viewModel: LoginScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension LoginScreenViewController {
	func configureUI(){
		configureEnterButton()
	}
	
	func configureEnterButton(){
		enterButton.setTitle("Вход", for: .normal)
		enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		enterButton.tintColor = .white
		
		enterButton.backgroundColor = .gray
		enterButton.layer.cornerRadius = 22
		enterButton.layer.borderWidth = 2
		enterButton.layer.borderColor = UIColor.gray.cgColor
		
		enterButton.contentEdgeInsets = UIEdgeInsets(top: 13, left: 8, bottom: 13, right: 8)
	}
	
}

private extension LoginScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = LoginScreenViewModelInput()
	

		output = viewModel.transform(input: input)
	}
}


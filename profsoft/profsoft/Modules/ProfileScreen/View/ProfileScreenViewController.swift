//
//  ProfileScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 02.08.2021.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

class ProfileScreenViewController: UIViewController, StoryboardBased {
	
	private let disposeBag = DisposeBag()
	
	private var input: ProfileScreenViewModelInputProtocol!
	private var output: ProfileScreenViewModelOutputProtocol!
	private var viewModel: ProfileScreenViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

		configureUI()
		bindUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func inject(viewModel: ProfileScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension ProfileScreenViewController {
	
	func configureUI(){
		
	}
	
}

private extension ProfileScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = ProfileScreenViewModelInput()
	

		output = viewModel.transform(input: input)
	}
}


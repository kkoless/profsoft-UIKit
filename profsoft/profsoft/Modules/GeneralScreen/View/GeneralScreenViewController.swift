//
//  GeneralScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class GeneralScreenViewController: UIViewController, StoryboardBased {

	private let disposeBag = DisposeBag()
	
	private var input: 	GeneralScreenViewModelInputProtocol!
	private var output: GeneralScreenViewModelOutputProtocol!
	private var viewModel: GeneralScreenViewModelProtocol!
	
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
	
	func inject(viewModel: GeneralScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension GeneralScreenViewController {
	func configureUI(){
		
	}

}

private extension GeneralScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = GeneralScreenViewModelInput()

		output = viewModel.transform(input: input)
	}
}

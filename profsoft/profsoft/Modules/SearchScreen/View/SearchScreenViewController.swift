//
//  SearchScreenViewController.swift
//  profsoft
//
//  Created by Кирилл Колесников on 09.08.2021.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

class SearchScreenViewController: UIViewController, StoryboardBased {

	private let disposeBag = DisposeBag()
	
	private var input: 	SearchScreenViewModelInputProtocol!
	private var output: SearchScreenViewModelOutputProtocol!
	private var viewModel: SearchScreenViewModelProtocol!
	
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
	
	func inject(viewModel: SearchScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension SearchScreenViewController {
	func configureUI(){
		
	}

}

private extension SearchScreenViewController {
	func bindUI(){
		bindViewModel()
	}
	
	func bindViewModel(){
		let input = SearchScreenViewModelInput()

		output = viewModel.transform(input: input)
	}
}

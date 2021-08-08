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
	
	@IBOutlet private weak var tableView: UITableView!
	
	private var input: ProfileScreenViewModelInputProtocol!
	private var output: ProfileScreenViewModelOutputProtocol!
	private var viewModel: ProfileScreenViewModelProtocol!
	
	private let onAppear = PublishRelay<Void>()
	private var imagePicker: ImagePicker!
	private var userImage = BehaviorRelay<UIImage>(value: UIImage(named: "userImage")!)

    override func viewDidLoad() {
        super.viewDidLoad()

		configureUI()
		bindUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		onAppear.accept(())
	}
	
	func inject(viewModel: ProfileScreenViewModelProtocol){
		self.viewModel = viewModel
	}

}

private extension ProfileScreenViewController {
	
	func configureUI(){
		configureViews()
		configureTableView()
		configureImagePicker()
		
	}
	
	func configureViews() {
		navigationController?.navigationBar.isHidden = true
	}
	
	func configureTableView() {
		tableView.register(cellType: HeaderTableViewCell.self)
		tableView.register(cellType: SectionCourcesTableViewCell.self)
		tableView.register(cellType: CertificateNumbTableViewCell.self)
		tableView.register(cellType: DirectionTableViewCell.self)
		tableView.register(cellType: EducationFormTableViewCell.self)
		tableView.register(cellType: StudyPeriodTableViewCell.self)
		tableView.register(cellType: ShowMoreTableViewCell.self)
		tableView.register(cellType: StudyTableViewCell.self)
		tableView.register(cellType: TeacherTableViewCell.self)
		tableView.register(cellType: CertificateTableViewCell.self)
		tableView.register(cellType: ShareTableViewCell.self)
		tableView.register(cellType: ShowLessTableViewCell.self)
		
		tableView.contentInsetAdjustmentBehavior = .never
		tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
		tableView.tableFooterView = UIView()
		tableView.alwaysBounceVertical = false
		tableView.bounces = false
	}
	
	func configureImagePicker() {
		imagePicker = ImagePicker(presentationController: self, delegate: self)
	}
}

extension ProfileScreenViewController: ImagePickerDelegate {
	
	func didSelect(image: UIImage?) {
		userImage.accept(image!)
	}
	
}

private extension ProfileScreenViewController {
	func bindUI(){
		bindViewModel()
		bindTableView()
	}
	
	func bindViewModel(){
		let input = ProfileScreenViewModelInput(onAppear: onAppear.asObservable(), imagePicker: imagePicker, tableView: tableView, userImage: userImage)
	

		output = viewModel.transform(input: input)
	}
	
	func bindTableView() {
		output.sections.drive(tableView.rx.items(dataSource: output.dataSource)).disposed(by: disposeBag)
			
	}
}

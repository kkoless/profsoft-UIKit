//
//  CellBuilder.swift
//  profsoft
//
//  Created by Кирилл Колесников on 27.07.2021.
//

import Foundation
import UIKit
import Reusable
import RxCocoa

protocol CodeCellConfigurable {
	associatedtype Model
	func configureCell(with model: Model)
}

protocol CellConfigurable: NibReusable {
	associatedtype Model
	func configureCell(with model: Model)
}

protocol ViewModable {
	associatedtype Model

	init(model: Model)
}

protocol CollectionViewModable {
	associatedtype Model
	associatedtype SelectedModel

	init(model: Model, selectedModel: PublishRelay<SelectedModel>)
}

protocol CellViewModelConfigurable: NibReusable {
	associatedtype ViewModel

	func configureCell(with viewModel: ViewModel)

}

final class EmptyCellBuilder<T: NibReusable> where T: UITableViewCell {

	static func build(tableView: UITableView, indexPath: IndexPath) -> T {
		let cell = tableView.dequeueReusableCell(for: indexPath,
												 cellType: T.self)
		cell.selectionStyle = .none
		return cell
	}
}

final class CellBuilder<T: CellConfigurable> where T: UITableViewCell {

	static func build(tableView: UITableView, indexPath: IndexPath, model: T.Model) -> T {
		let cell = tableView.dequeueReusableCell(for: indexPath,
												 cellType: T.self)
		cell.configureCell(with: model)
		cell.selectionStyle = .none
		return cell
	}
}

final class CollectionCellBuilder<T: CellConfigurable> where T: UICollectionViewCell {

	static func build(collectionView: UICollectionView, indexPath: IndexPath, model: T.Model) -> T {
		let cell = collectionView.dequeueReusableCell(for: indexPath,
												 cellType: T.self)
		cell.configureCell(with: model)
		return cell
	}
}

class CellViewModelBuilder<T: CellViewModelConfigurable, VM: ViewModable> where T: UITableViewCell {

	class func build(tableView: UITableView, indexPath: IndexPath, model: VM.Model) -> T {
		let cell = tableView.dequeueReusableCell(for: indexPath, cellType: T.self)
		guard let viewModel = VM(model: model) as? T.ViewModel else { return cell }
		cell.configureCell(with: viewModel)
		cell.selectionStyle = .none
		return cell
	}
}

class CellCollectionViewModelBuilder<T: CellViewModelConfigurable, VM: CollectionViewModable> where T: UITableViewCell {

	class func build(tableView: UITableView, indexPath: IndexPath, model: VM.Model, selectedModel: PublishRelay<VM.SelectedModel>) -> T {
		let cell = tableView.dequeueReusableCell(for: indexPath, cellType: T.self)
		guard let viewModel = VM(model: model, selectedModel: selectedModel) as? T.ViewModel else { return cell }
		cell.configureCell(with: viewModel)
		cell.selectionStyle = .none
		return cell
	}
}

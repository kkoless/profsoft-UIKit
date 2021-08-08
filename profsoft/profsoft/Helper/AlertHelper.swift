//
//  AlertHelper.swift
//  profsoft
//
//  Created by Кирилл Колесников on 30.07.2021.
//

import UIKit

enum AlertHelper {
	
	static var oneButtonCancel: UIAlertController {
		let urlCompany = URL(string: "academy@profsoft.pro")!
		let alert = UIAlertController(title: "Забыли пароль?", message: "Напишите в поддержку \(urlCompany)",         preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Вернуться", style: .default))
		return alert
	}
	
	static func userImagePick(pick: UIImagePickerController, view: UIViewController) -> UIAlertController {
		let alert = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
		
		let cameraPhoto = UIAlertAction(title: "Сфотографировать", style: .default, handler: {
			(alert: UIAlertAction) -> Void in
			if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
				
				pick.mediaTypes = ["public.image"]
				pick.sourceType = UIImagePickerController.SourceType.camera;
				view.present(pick, animated: true, completion: nil)
			}
			else{
				UIAlertController(title: "iOSDevCenter", message: "No Camera available.", preferredStyle: .alert).show(view, sender: nil);
			}
			
		})
		
		let photoLibrary = UIAlertAction(title: "Загрузить из галереи", style: .default, handler: {
			(alert: UIAlertAction) -> Void in
			if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
				pick.mediaTypes = ["public.image"]
				pick.sourceType = UIImagePickerController.SourceType.photoLibrary;
				view.present(pick, animated: true, completion: nil)
			}
			
		})
		
		let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: {
			(alert: UIAlertAction) -> Void in
			
		})
		
		alert.addAction(cameraPhoto)
		alert.addAction(photoLibrary)
		alert.addAction(cancelAction)
		
		return alert
	}

}

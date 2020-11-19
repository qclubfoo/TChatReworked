//
//  ProfileVC.swift
//  t-chatReworked
//
//  Created by Дмитрий on 20.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var mainEditButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var avatarEditButton: UIButton!
    @IBOutlet weak var gcdSaveButton: UIButton!
    @IBOutlet weak var operationSaveButton: UIButton!
    
    var presentationAssembly: IPresentationAssembly!
    
    var editIsOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainEditButton.addTarget(self, action: #selector(editModeOn), for: .touchUpInside)
        avatarEditButton.addTarget(self, action: #selector(avatarEditButtonTapped), for: .touchUpInside)
        gcdSaveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        operationSaveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

    }
    
    @objc func editModeOn() {
        if !editIsOn {
            toggleButtonsState()
            editIsOn = !editIsOn
        }
    }
    
    @objc func avatarEditButtonTapped() {
        let ac = UIAlertController(title: "Change avatar", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Download", style: .default) { [weak self] (_) in
            if let vc = self?.presentationAssembly.downloadAvatarVC() {
                self?.present(vc, animated: true)
            }
        
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    @objc func saveButtonTapped() {
        toggleButtonsState()
        editIsOn = !editIsOn
    }
    
    private func toggleButtonsState() {
        mainEditButton.isEnabled = !mainEditButton.isEnabled
        avatarEditButton.isEnabled = !avatarEditButton.isEnabled
        gcdSaveButton.isEnabled = !gcdSaveButton.isEnabled
        operationSaveButton.isEnabled = !operationSaveButton.isEnabled
    }

}

extension ProfileVC {
    static func storyboardInstance(presentationAssembly: IPresentationAssembly) -> ProfileVC {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? ProfileVC {
            vc.presentationAssembly = presentationAssembly
            return vc
        }
        fatalError("Can't instantiate view controller from storyboard")
    }
}

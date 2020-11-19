//
//  DownloadAvatarVC.swift
//  t-chatReworked
//
//  Created by Дмитрий on 20.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class DownloadAvatarVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presentationAssembly: IPresentationAssembly!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}

extension DownloadAvatarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
    
}

extension DownloadAvatarVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.width - 40) / 3
        return CGSize(width: side, height: side)
    }
}

extension DownloadAvatarVC {
    
    static func storyboardInstance(presentationAssembly: IPresentationAssembly) -> DownloadAvatarVC {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? DownloadAvatarVC {
            vc.presentationAssembly = presentationAssembly
            return vc
        }
        fatalError("Can't instantiate view controller from storyboard")
    }
}

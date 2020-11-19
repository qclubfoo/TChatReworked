//
//  ChannelsListVC.swift
//  t-chatReworked
//
//  Created by Дмитрий on 17.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class ChannelsListVC: UIViewController, IChannelsListVCModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presentationAssembly: IPresentationAssembly!
    private var model: IChannelsListVCModel!
    
    private var dataSource = [ChannelModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        model.fetchChannels()
    }
    
    // MARK: IChannelsListVCModelDelegate methods
    
    func setup(dataSource: [ChannelModel]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }
    
    // MARK: Navigation items setup methods and targets
    
    private func setupNavigationItems() {
        
        title = "T-Chat"
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "profile"),
                            style: .plain,
                            target: self,
                            action: #selector(showProfileVC)),
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewChannel))
            ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(showThemeSettings))
    }
    
    @objc private func showProfileVC() {
        print(#function)
        let profileVC = presentationAssembly.profileVC()
//        profileVC.modalPresentationStyle = .formSheet
        present(profileVC, animated: true)
//        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func showThemeSettings() {
        print(#function)
    }
    
    @objc private func addNewChannel() {
        print(#function)
    }
    
    // MARK: SetupTableView

    private func setupTableView() {
        self.model.fetchChannels()
    }
    
}

    // MARK: TableViewDataSource

extension ChannelsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell else { return UITableViewCell() }
        let currentCellData = dataSource[indexPath.row]
        cell.channelNameLabel.text = currentCellData.name
        cell.lastMessageLabel.text = currentCellData.lastMessage
        cell.lastActivityLabel.text = currentCellData.lastActivityString
        return cell
    }
}

    // MARK: TableViewDelegate

extension ChannelsListVC: UITableViewDelegate {
    
}

    // MARK: StoryboardInstance for ChannelsListVC

extension ChannelsListVC {
    static func storyboardInstance(model: IChannelsListVCModel, presentationAssembly: IPresentationAssembly) -> ChannelsListVC {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? ChannelsListVC {
            vc.model = model
            vc.presentationAssembly = presentationAssembly
            return vc
        }
        fatalError("Can't instantiate view controller from storyboard")
    }
}

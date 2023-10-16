//
//  ViewController.swift
//  CollectionView
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit
import NeonSDK

class ViewController: UIViewController {
    
    var cellSlider : UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let collectionView = NeonCollectionView<AppModel,AppCell>(objects: appArray, itemsPerRow: 3,
                                                                  leftPadding: 10, rightPadding: 10,
                                                                  horizontalItemSpacing: 10, verticalItemSpacing: 10,
                                                                  heightForItem: 100)
        
        collectionView.backgroundColor = .lightGray
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 16
        
        let refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        collectionView.didSelect = { object, indexPath in
            let detailVC = DetailVC()
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.selectedApp = object
            self.present(detailVC, animated: true)
        }
        
        collectionView.contextMenuActions = [ContextMenuAction<AppModel>(title: "Share", imageSystemName: "square.and.arrow.up",
                                                                         isDestructive: false, action: { [self] app, indexPath in
            let shareText = "Check out this awesome app!"
            let shareURL = URL(string: app.appStoreURL)
            let activityItems: [Any] = [shareText, shareURL as Any]
            
            let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
            self.present(activityController, animated: true)
        })]
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        cellSlider = UISlider()
        let minCellWidth : Float = (Float(view.frame.width * 0.95) - 40) / 3
        let maxCellWidth : Float = Float(view.frame.width * 0.95) - 40
        cellSlider?.minimumValue = minCellWidth
        cellSlider?.maximumValue = maxCellWidth
        cellSlider?.value = cellSlider!.minimumValue
        cellSlider?.minimumValueImage = UIImage(systemName: "square.grid.3x3.fill")
        cellSlider?.maximumValueImage = UIImage(systemName: "square.fill")
        cellSlider?.backgroundColor = .lightGray
        cellSlider?.layer.borderColor = UIColor.black.cgColor
        cellSlider?.layer.borderWidth = 2
        cellSlider?.layer.cornerRadius = 16
        cellSlider?.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(cellSlider!)
        cellSlider?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(40)
        })
    }
    
    //MARK: PULL TO REFRESH
    @objc private func refreshData(_ sender: UIRefreshControl) {
        
    }
    
    @objc func sliderValueChanged(_ sender : UISlider) {
        
    }
    
}


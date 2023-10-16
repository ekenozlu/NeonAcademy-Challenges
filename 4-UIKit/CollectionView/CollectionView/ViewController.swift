//
//  ViewController.swift
//  CollectionView
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var cellSlider : UISlider?
    var appCollectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        title = "Apps"
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        appCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        appCollectionView?.backgroundColor = .lightGray
        appCollectionView?.layer.borderColor = UIColor.black.cgColor
        appCollectionView?.layer.borderWidth = 2
        appCollectionView?.layer.cornerRadius = 16
        appCollectionView?.register(AppCell.self, forCellWithReuseIdentifier: "appCell")
        appCollectionView?.delegate = self
        appCollectionView?.dataSource = self
        
        let refreshControl = UIRefreshControl()
        appCollectionView?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        view.addSubview(appCollectionView!)
        appCollectionView?.snp.makeConstraints { make in
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
            make.top.equalTo(appCollectionView!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(40)
        })
        
        appCollectionView?.reloadData()
    }
    
    
    //MARK: CV CONFIGURE
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appCell", for: indexPath) as! AppCell
        cell.appIconView?.image = appArray[indexPath.row].appIcon
        cell.appIconView?.layer.cornerRadius = CGFloat(cellSlider!.value) / 4.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(cellSlider?.value ?? 30), height: Int(cellSlider?.value ?? 30))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //MARK: SLIDER CONFIGURE
   
    
    //MARK: CONTEXT MENU CONFIGURE
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        createContextMenu(index : indexPath.row)
    }
    
    func createContextMenu(index: Int) -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"),
                                 identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                let shareText = "Check out this awesome app!"
                let shareURL = URL(string: appArray[index].appStoreURL)
                let activityItems: [Any] = [shareText, shareURL as Any]
                
                let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
                self.present(activityController, animated: true)
            }
            return UIMenu(title: "Options", image: nil, identifier: nil,
                          options: UIMenu.Options.displayInline, children: [share])
        }
        return context
    }
    
    //MARK: PULL TO REFRESH
    @objc private func refreshData(_ sender: UIRefreshControl) {
        appCollectionView?.reloadData()
        sender.endRefreshing()
    }
    
    //MARK: DID SELECT
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.selectedApp = appArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    @objc func sliderValueChanged(_ sender : UISlider) {
        cellSlider?.value = roundf(sender.value)
        appCollectionView?.reloadData()
    }
    
}


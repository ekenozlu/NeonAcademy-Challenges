//
//  TabBarController.swift
//  TabBar
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        let vc1 = FirstVC()
        let vc2 = SecondVC()
        let vc3 = ThirdVC()
        let vc4 = FourthVC()
        
        tabBar.backgroundColor = .green
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.gray
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -20)
        tabBar.layer.shadowRadius = 20
        
        vc1.tabBarItem = UITabBarItem(title: "Fist", image: UIImage(systemName: "figure.boxing"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "Kick", image: UIImage(systemName: "figure.kickboxing"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "Shoot", image: UIImage(systemName: "figure.hunting"), tag: 2)
        vc4.tabBarItem = UITabBarItem(title: "Heal", image: UIImage(systemName: "figure.mind.and.body"), tag: 3)
        
        let vcArray = [vc1,vc2,vc3,vc4]
        setViewControllers(vcArray, animated: false)
    }
    
}

//
//  ViewController.swift
//  Neon ScollableLabel
//
//  Created by Eken Özlü on 16.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Font.configureFonts(font: .Inter)
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let label = NeonScrollLabel()
        label.text = "Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, Scrollable Text, "
        label.labelSpacing = 30    // Distance between start and end labels
        label.pauseInterval = 1.7  // Seconds of pause before scrolling starts again
        label.scrollSpeed = 30     // Pixels per second
        label.textAlignment = .left // Centers text when no auto-scrolling is applied
        label.fadeLength = 12 // Length of the left and right edge fade, 0 to disable
        label.scrollDirection = .left // Scroll direction
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

#Preview {
    ViewController()
}


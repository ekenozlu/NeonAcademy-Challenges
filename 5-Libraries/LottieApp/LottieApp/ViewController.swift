//
//  ViewController.swift
//  LottieApp
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit
import Lottie
import CoreImage

enum ProgressKeyFrames: CGFloat {
    case start = 0
    case end = 50
}

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var animationView : LottieAnimationView?
    var imageToProcess : UIImage?
    var imageView : UIImageView?
    var chooseButton : UIButton?
    var startStopButton : UIButton?
    
    var isAnimating = false
    var startFrame : CGFloat = 0
    var endFrame : CGFloat = 50
    var currentFrame : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        imageView = UIImageView()
        let startImage = UIImage(systemName: "photo")?.withRenderingMode(.alwaysTemplate)
        startImage?.withTintColor(.darkGray)
        imageView?.image = startImage
        imageView?.contentMode = .scaleAspectFit
        view.addSubview(imageView!)
        imageView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(imageView!.snp.width).multipliedBy(0.6)
        }
        
        chooseButton = UIButton(type: .system)
        chooseButton?.setTitle("Choose Photo from Gallery", for: .normal)
        chooseButton?.setTitleColor(.white, for: .normal)
        chooseButton?.backgroundColor = .systemBlue
        chooseButton?.layer.cornerRadius = 8
        chooseButton?.layer.borderColor = UIColor.black.cgColor
        chooseButton?.layer.borderWidth = 3
        chooseButton?.addTarget(self, action: #selector(chooseButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(chooseButton!)
        chooseButton?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(45)
        })
        
        startStopButton = UIButton(type: .system)
        startStopButton?.setTitle("Stop Animation", for: .normal)
        startStopButton?.setTitleColor(.white, for: .normal)
        startStopButton?.backgroundColor = .systemBlue
        startStopButton?.layer.cornerRadius = 8
        startStopButton?.layer.borderColor = UIColor.black.cgColor
        startStopButton?.layer.borderWidth = 3
        startStopButton?.isHidden = true
        startStopButton?.addTarget(self, action: #selector(animationButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(startStopButton!)
        startStopButton?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(45)
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageToProcess = pickedImage
            imageView?.image = imageToProcess
            chooseButton?.isHidden = true
            startStopButton?.isHidden = false
            
            animationView = .init(name: "imageProcess")
            animationView?.contentMode = .scaleAspectFit
            animationView?.backgroundColor = .gray
            animationView?.loopMode = .playOnce
            animationView?.animationSpeed = 0.3
            view.addSubview(animationView!)
            animationView?.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.95)
                make.height.equalTo(imageView!.snp.width).multipliedBy(0.6)
            }
            animationView?.play(fromFrame: startFrame, toFrame: endFrame, loopMode: .playOnce, completion: { completed in
                self.animationView?.isHidden = true
                self.showFilteredImage()
            })
            isAnimating = true
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func showFilteredImage() {
        guard let uiImage = imageToProcess else { return }
        let ciImage = CIImage(image: uiImage)
        guard let filter = CIFilter(name: "CINoiseReduction") else { return }
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        let sharpnessValue = (animationView!.currentFrame/endFrame) * 1000
        filter.setValue(sharpnessValue, forKey: kCIInputSharpnessKey)
        guard let outputImage = filter.outputImage else { return }
        let newImage = UIImage(ciImage: outputImage)
        imageView!.image = newImage
    }
    
    @objc func chooseButtonClicked(_ sender : UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func animationButtonClicked(_ sender : UIButton) {
        if isAnimating {
            //HIDE ANIMATION AND STOP
            animationView?.isHidden = true
            animationView?.pause()
            currentFrame = animationView?.currentFrame ?? 0
            
            showFilteredImage()
            
            //UPDATE UI
            startStopButton?.setTitle("Start Animation", for: .normal)
            
            //TOGGLE BOOLEAN
            isAnimating = false
        } else {
            //SHOW ANIMATION AND START
            animationView?.isHidden = false
            animationView?.play(fromFrame: currentFrame, toFrame: endFrame, loopMode: .playOnce, completion: { completed in
                self.animationView?.isHidden = true
                self.showFilteredImage()
            })
            
            //UPDATE UI
            startStopButton?.setTitle("Stop Animation", for: .normal)
            
            //TOGGLE BOOLEAN
            isAnimating = true
        }
    }
    
}


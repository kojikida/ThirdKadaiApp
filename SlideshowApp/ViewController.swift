//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Koji Kida on 2020/03/16.
//  Copyright © 2020 Koji Kida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "image01")
        imageView.image = image
    }
    
    var displayImageNo = 0
    
    let imageNameArray = ["image01", "image02", "image03"]
    
    func displayImage() {
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            displayImageNo += 1
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if displayImageNo >= 1 && displayImageNo <= imageNameArray.count - 1 {
            displayImageNo -= 1
            displayImage()
        } else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    @IBAction func switchButtonTap(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
            switchButton.setTitle("停止", for: .normal)
            
            self.view.backgroundColor = UIColor.lightGray
            switchButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            switchButton.setTitle("再生", for: .normal)
            
            self.view.backgroundColor = UIColor.white
            switchButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        }
    }
    @objc func updateTimer(_ timer: Timer) {
        if displayImageNo < imageNameArray.count - 1 {
            displayImageNo += 1
            displayImage()
            print(displayImageNo)
            
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo)
        }
    }
    
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoom", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomInViewController: ZoomInViewController = segue.destination as! ZoomInViewController
        
        let name = imageNameArray[displayImageNo]
        
        let image = UIImage(named: name)
        
        zoomInViewController.selectedImg = image
    }


}


//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by Koji Kida on 2020/03/16.
//  Copyright © 2020 Koji Kida. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImg

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

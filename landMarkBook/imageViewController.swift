//
//  imageViewController.swift
//  landMarkBook
//
//  Created by MERT on 14.07.2021.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarklabel: UILabel!
    
    var selectedlandmarkName = ""
    var selectedlandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarklabel.text = selectedlandmarkName
        imageView.image = selectedlandmarkImage

        
    }
    

}

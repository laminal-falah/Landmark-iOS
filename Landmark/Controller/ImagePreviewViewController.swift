//
//  ImagePreviewViewController.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import UIKit

class ImagePreviewViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var imagePreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePreview.image = image
    }

}

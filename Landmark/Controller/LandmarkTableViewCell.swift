//
//  LandmarkTableViewCell.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLandmark: UIImageView!
    @IBOutlet weak var nameLandmark: UILabel!
    @IBOutlet weak var locationLandmark: UILabel!
    
    var landmark: Landmark! {
        didSet {
            imageLandmark.image = landmark.image
            nameLandmark.text = landmark.name
            locationLandmark.text = landmark.state
        }
    }
    
}

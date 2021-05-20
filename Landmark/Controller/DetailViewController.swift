//
//  DetailViewController.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var landmark: Landmark?
    
    let manager = CLLocationManager()
    
    @IBOutlet weak var location: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLandmark: UILabel!
    @IBOutlet weak var locationLandmark: UILabel!
    @IBOutlet weak var descriptionLandmark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Detail"
        
        location.delegate = self
        location.setUserTrackingMode(.followWithHeading, animated: true)
        
        imageView.image = landmark?.image
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        
        nameLandmark.text = landmark?.name
        locationLandmark.text = landmark?.state
        descriptionLandmark.text = landmark?.description
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doImagePreview(gesture:)))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @objc func doImagePreview(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil && landmark?.image != nil {
            let preview = ImagePreviewViewController(nibName: "ImagePreviewViewController", bundle: nil)
            
            preview.image = landmark?.image
            
            present(preview, animated: true, completion: nil)
        }
    }
    
}

extension DetailViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125)
        let region = MKCoordinateRegion(center: landmark!.locationCoordinates, span: span)
        location.setRegion(region, animated: true)
    }
    
}

extension DetailViewController: CLLocationManagerDelegate {
    
}

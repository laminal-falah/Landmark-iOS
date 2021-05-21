//
//  Landmark.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable {
    var id: Int
    var name: String
    var state: String
    var description: String
    
    private var imageName: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longtitude
        )
    }
    
    struct Coordinates: Codable, Hashable {
        var latitude: Double
        var longtitude: Double
    }
}

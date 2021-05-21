//
//  Profile.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import Foundation
import SwiftUI

struct Profile: Codable {
    var name: String
    var email: String
    var job: String
    
    private var imageName: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
    
    var contacts: [Contact]
    
    struct Contact: Codable, Hashable {
        var name: String
        var url: String
    }
}

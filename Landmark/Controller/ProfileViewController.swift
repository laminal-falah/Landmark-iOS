//
//  ProfileViewController.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    let profile = ModelData.shared.profile
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var jobProfile: UILabel!
    
    @IBOutlet weak var contactTableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Profile"
        
        imageProfile.image = profile.image
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        imageProfile.clipsToBounds = true
        
        nameProfile.text = "Name : \(profile.name)"
        emailProfile.text = "Email : \(profile.email)"
        jobProfile.text = "Job : \(profile.job)"
        
        contactTableList.dataSource = self
    }

}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Hobby Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Hobby Cell")
        }
        
        cell?.textLabel?.text = profile.contacts[indexPath.row].name
        cell?.detailTextLabel?.text = profile.contacts[indexPath.row].url
        
        return cell!
    }
    
}


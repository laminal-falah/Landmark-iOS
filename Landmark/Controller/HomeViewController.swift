//
//  HomeViewController.swift
//  Landmark
//
//  Created by Laminal Falah on 20/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    let landmarks = ModelData.shared.landmarks
    
    @IBOutlet weak var landmarkTableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Landmark"
        
        landmarkTableList.dataSource = self
        
        landmarkTableList.delegate = self
        
        landmarkTableList.register(UINib(nibName: "LandmarkTableViewCell", bundle: nil), forCellReuseIdentifier: "Landmark Cell")
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Landmark Cell", for: indexPath) as? LandmarkTableViewCell else {
            return UITableViewCell()
        }
        
        cell.landmark = landmarks[indexPath.row]
        
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.landmark = landmarks[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}



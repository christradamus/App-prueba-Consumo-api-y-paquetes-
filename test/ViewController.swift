//
//  ViewController.swift
//  test
//
//  Created by Christian Pérez on 04-09-23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var logoImageview: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = ""
        mailLabel.text = ""
        idLabel.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    
    @IBAction func getUserButton(_ sender: Any) {
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 5114483) { (user) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.mailLabel.text = user.email
            self.idLabel.text = user.status
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.mailLabel.text = error?.localizedDescription
        }
    }
    
    @IBAction func addUserButton(_ sender: Any) {
        let newUser = NewUser(name: "nico Perez", email: "ppeaaarez@testing.cl", gender: "Maale", status: "Active")
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser) { (user) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.mailLabel.text = user.email
            self.idLabel.text = user.status
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.mailLabel.text = error?.localizedDescription
        }
    }
    
    @IBAction func updateUserbutton(_ sender: Any) {
        let newUser = NewUser(name: "Letty Perez", email: nil, gender: nil, status: nil)
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id: 5115474, user: newUser) { (user) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = user.name
            self.mailLabel.text = user.email
            self.idLabel.text = user.status
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.mailLabel.text = error?.localizedDescription
        }
    }
    @IBAction func deleteUserButton(_ sender: Any) {
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.deleteUser(id: 5115474) {
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = "Se ha borrado el usuario"
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.mailLabel.text = error?.localizedDescription
        }
                                             
    }
    @IBAction func downloadImage(_ sender: Any) {
        downloadButton.isHidden = true
        logoImageview.kf.setImage(with: URL(string: "https://www.apple.com/v/swift/c/images/overview/icon_swift_hero_large.png"))
    }
}
                                        
                                        
                    
                                          

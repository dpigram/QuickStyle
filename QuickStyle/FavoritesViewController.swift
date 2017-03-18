//
//  FavoritesViewController.swift
//  QuickStyle
//
//  Created by Terell Pigram on 1/2/17.
//  Copyright © 2017 Derell Pigram. All rights reserved.
//

import UIKit
import QuartzCore

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var displayNamelabel: UILabel!
    
    private let userDefaults = UserDefaults.standard
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.view.backgroundColor = .clear
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.displayNamelabel.text = self.userDefaults.value(forKey: "loggedInUserName") as? String ?? ""
        self.profilePictureImageView.backgroundColor = UIColor.darkGray
        self.profilePictureImageView.clipsToBounds = true
        self.profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.width / 2
        self.profilePictureImageView.layer.borderWidth = 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogoutButtonTapped(_ sender: Any) {
        // setting loggedIn flag
        UserDefaults.standard.set(false, forKey: "loggedIn");
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name("QSAuthenticationChanged"), object: nil);
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.drawerController?.toggle(.left, animated: true, completion: nil);
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Barbers"
        case 1:
            return "Shops"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Barber \(indexPath.row)"
        default:
            cell.textLabel?.text = "Shop \(indexPath.row)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.appDelegate.drawerController?.closeDrawer(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: 16);
        header.textLabel?.textColor = UIColor.white
        header.contentView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let choseImage: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.profilePictureImageView.image = choseImage
        picker.dismiss(animated: true, completion: nil)
        //TODO: save image to documents folder
    }
    
    @IBAction func profilePictureTapped(_ sender: Any) {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }

}

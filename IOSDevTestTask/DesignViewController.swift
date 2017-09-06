//
//  DesignViewController.swift
//  IOSDevTestTask
//
//  Created by macMini on 9/1/17.
//  Copyright © 2017 macMini. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var pagesView: UIView!
    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var pagesButton: UIButton!
    @IBOutlet weak var followersButton: UIButton!
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var suggestedCollectionView: UICollectionView!
    
    
    let userNickName      = "Vika@"
    let userName          = "Viktoria Colt"
    let userStatusMessage = "Do you want to go out with me?\n(A) Yes (B) A (C) B."
    let numberOfPages     = 180
    let numberOfFollowers = 1244
    let numberOfFollowing  = 12455
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        suggestedCollectionView.register(UINib(nibName: "SuggestedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "suggestedCell")
        self.pageConfigs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SuggestedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "suggestedCell", for: indexPath) as! SuggestedCollectionViewCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width / 3 - 25), height: (self.view.frame.height / 3 - 110))
    }
    
    func setViewBorderColor(view: UIView, red: Double, green: Double, blue: Double){
        let color = UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
        view.layer.borderColor = color.cgColor
    }
    
    func setButtonBorderColor(button: UIButton, red: Double, green: Double, blue: Double){
        let color = UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
        button.layer.borderColor = color.cgColor
    }
    
    func pageConfigs(){
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height / 2
        self.profileView.layer.cornerRadius      = self.profileView.frame.size.height / 2
        
        self.followButton.layer.cornerRadius = self.followButton.frame.size.height / 2
        self.shareButton.layer.cornerRadius  = self.shareButton.frame.size.height / 2
        
        self.setButtonBorderColor(button: self.shareButton, red: 55, green: 181, blue: 189)
        self.setButtonBorderColor(button: self.followButton, red: 55, green: 181, blue: 189)
        self.setViewBorderColor(view: self.pagesView, red: 224, green: 227, blue: 227)
        self.setViewBorderColor(view: self.followersView, red: 224, green: 227, blue: 227)
        self.setViewBorderColor(view: self.followingView, red: 224, green: 227, blue: 227)
        
        self.pagesLabel.text = String(self.numberOfPages)
        self.followersLabel.text = String(self.numberOfFollowers)
        self.followingLabel.text = String(self.numberOfFollowing)
        
        self.followButton.layer.borderWidth  = 1
        self.shareButton.layer.borderWidth   = 1
        self.pagesView.layer.borderWidth     = 1
        self.followersView.layer.borderWidth = 1
        self.followingView.layer.borderWidth = 1
        
        self.setViewBorderColor(view: self.profileView, red: 224, green: 227, blue: 227)
        self.profileView.layer.borderWidth = 1
        
        self.nickNameLabel.text      = self.userNickName
        self.nameLabel.text          = self.userName
        self.statusMessageLabel.text = self.userStatusMessage
        
        self.navigationItem.title = self.userNickName
    }
    
    @IBAction func onFollowButtonPress(_ sender: UIButton) {
        if self.followButton.currentTitle == "+ Follow" {
            self.followButton.setTitle("Following", for: UIControlState.normal)
            self.followButton.backgroundColor = UIColor.white
            let color = UIColor(red: 55/255.0, green: 181/255.0, blue: 189/255.0, alpha: 1.0)
            self.followButton.setTitleColor(color, for: UIControlState.normal)
        } else {
            self.followButton.setTitle("+ Follow", for: UIControlState.normal)
            let color = UIColor(red: 55/255.0, green: 181/255.0, blue: 189/255.0, alpha: 1.0)
            self.followButton.backgroundColor = color
            self.followButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

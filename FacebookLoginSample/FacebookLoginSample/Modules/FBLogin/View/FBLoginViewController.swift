//
//  FBLoginViewController.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class FBLoginViewController: UIViewController {

    @IBOutlet weak var loginButtonArea: UIView!
    @IBOutlet weak var userDetailArea: UIView!
    
    @IBOutlet weak var facebookIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var presenter: FBLoginPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let loginButton = FBLoginButton(permissions: [.publicProfile, .email, .userBirthday])
        loginButton.center = loginButtonArea.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
}

// MARK: LoginButtonDelegate
extension FBLoginViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Did complete login via LoginButton with result \(String(describing: result)) " + "error\(String(describing: error))")
        
        presenter.loginSucceeded()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did logout via LoginButton")
        
        presenter.logoutSucceeded()
    }
}

extension FBLoginViewController: FBLoginView {
    func showUserDetail(user: User) {
        userDetailArea.isHidden = false
        
        facebookIdLabel.text = user.id
        nameLabel.text = user.name
        emailLabel.text = user.email
        birthdayLabel.text = user.birthDay
    }
    
    func hideUserDetail() {
        userDetailArea.isHidden = true
    }
}

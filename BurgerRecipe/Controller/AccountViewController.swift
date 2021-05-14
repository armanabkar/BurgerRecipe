//
//  AccountViewController.swift
//  BurgerRecipe
//
//  Created by Arman Abkar on 5/14/21.
//

import UIKit
import AuthenticationServices

class AccountViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.string(forKey: "name"), let email = UserDefaults.standard.string(forKey: "email") {
            titleLabel.text = "Hi \(name)"
            descriptionLabel.text = email
        } else {
            let signInButton = ASAuthorizationAppleIDButton()
            signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
            stackView.addArrangedSubview(signInButton)
        }
    }
    
    @objc func signInTapped() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

extension AccountViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window ?? ASPresentationAnchor()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let credentials = authorization.credential as? ASAuthorizationAppleIDCredential, let name = credentials.fullName?.givenName {
            
            titleLabel.text = "Hi \(name)"
            descriptionLabel.text = credentials.email
            stackView.isHidden = true
            
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(credentials.email, forKey: "email")
        }
        
    }
    
}

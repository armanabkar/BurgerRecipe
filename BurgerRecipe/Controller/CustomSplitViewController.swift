//
//  CustomSplitViewController.swift
//  BurgerRecipe
//
//  Created by Arman Abkar on 5/14/21.
//

import UIKit

class CustomSplitViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredDisplayMode = .oneBesideSecondary
        self.delegate = self
    }
}

extension CustomSplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}

//
//  ContainerViewController.swift
//  Tapp
//
//  Created by Luis Arias on 05/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import QuartzCore

enum MenuPanelState {
    case MenuExpanded
    case MenuCollapsed
}

class ContainerViewController: UIViewController {
    
    var hashtagTableNavigationViewController: UINavigationController!
    var hashatagTableViewController: HashtagTableViewController!
    var menuPanelViewController: MenuPanelViewController!
    let hashtagTablePanelExpandedOffset: CGFloat = 60
    
    var currentState: MenuPanelState = .MenuCollapsed {
        didSet {
            let shouldShowShadow = currentState != .MenuCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    override func viewDidLoad() {
        
        self.hashatagTableViewController = UIStoryboard.centerViewController()
        self.hashatagTableViewController.delegate = self
        self.hashtagTableNavigationViewController = UINavigationController(rootViewController: self.hashatagTableViewController)
        view.addSubview(self.hashtagTableNavigationViewController.view)
        addChildViewController(self.hashtagTableNavigationViewController)
        
        self.hashtagTableNavigationViewController.didMoveToParentViewController(self)
    }
}

extension ContainerViewController: HashtagTableViewControllerDelegate {
    func togglePanel() {
        let notAlreadyExpanded = (currentState != .MenuExpanded)
        
        if notAlreadyExpanded {
            addMenuViewController()
        }
        animateMenuPanel(notAlreadyExpanded)
    }
    
    func addMenuViewController() {
        if menuPanelViewController == nil {
            menuPanelViewController = UIStoryboard.menuPanelViewController()
            menuPanelViewController.items = MenuItem.createItems()
            
            addChildMenuPanelViewController(menuPanelViewController)
        }
    }
    
    func addChildMenuPanelViewController(menuPanel: MenuPanelViewController) {
        view.insertSubview(menuPanel.view, atIndex: 0)
        addChildViewController(menuPanel)
        menuPanel.didMoveToParentViewController(self)
    }
    
    func animateMenuPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .MenuExpanded
            animateHashtagTablePanelXPosition(CGRectGetWidth(hashtagTableNavigationViewController.view.frame) - hashtagTablePanelExpandedOffset)
        } else {
            animateHashtagTablePanelXPosition(0) { finished in
                self.currentState = .MenuCollapsed
                self.menuPanelViewController.view.removeFromSuperview()
                self.menuPanelViewController = nil
            }
        }
    }
    
    func animateHashtagTablePanelXPosition(targetPositon: CGFloat, completion: (Bool -> Void)! = nil) {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            self.hashtagTableNavigationViewController.view.frame.origin.x = targetPositon
            }, completion: completion)
    }
    
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        
        if shouldShowShadow {
            self.hashtagTableNavigationViewController.view.layer.shadowOpacity = 0.8
        } else {
            self.hashtagTableNavigationViewController.view.layer.shadowOpacity = 0.0
        }
    }
}

private extension UIStoryboard {
    class func mainStoriboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func menuPanelViewController() -> MenuPanelViewController {
        return (mainStoriboard().instantiateViewControllerWithIdentifier("SidePanelViewController") as? MenuPanelViewController)!
    }
    
    class func centerViewController() -> HashtagTableViewController {
        return (mainStoriboard().instantiateViewControllerWithIdentifier("HashtagTableViewController") as? HashtagTableViewController)!
    }
}

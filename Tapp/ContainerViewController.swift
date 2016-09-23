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
    
    case menuExpanded
    case menuCollapsed
    
}

class ContainerViewController: UIViewController {

    var trendNavigationViewController: UINavigationController!
    var trendViewController: TrendCollectionViewController!
    var menuPanelViewController: MenuPanelViewController!
    let panelExpandedOffset: CGFloat = 60

    var currentState: MenuPanelState = .menuCollapsed {
        didSet {
            let shouldShowShadow = currentState != .menuCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }

    override func viewDidLoad() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0)
        
        self.trendViewController = TrendCollectionViewController(collectionViewLayout: flowLayout)
        self.trendViewController.parentView = self
        self.trendViewController.delegate = self
        self.trendNavigationViewController = UINavigationController(rootViewController: self.trendViewController)
        
        view.addSubview(self.trendNavigationViewController.view)
        
        self.trendNavigationViewController.didMove(toParentViewController: self)
    }
}

extension ContainerViewController: TrendCollectionViewControllerDelegate {
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .menuExpanded)
        
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
    
    func addChildMenuPanelViewController(_ menuPanel: MenuPanelViewController) {
        view.insertSubview(menuPanel.view, at: 0)
        addChildViewController(menuPanel)
        menuPanel.didMove(toParentViewController: self)
    }
    
    func animateMenuPanel(_ shouldExpand: Bool) {
        
        if shouldExpand {
            currentState = .menuExpanded
            animateTrendNavigationXPosition(trendViewController.view.frame.width - panelExpandedOffset)
        } else {
            animateTrendNavigationXPosition(0) { finished in
                self.currentState = .menuCollapsed
                self.menuPanelViewController.view.removeFromSuperview()
                self.menuPanelViewController = nil
            }
        }
    }
    
    func animateTrendNavigationXPosition(_ targetPositon: CGFloat, completion: ((Bool) -> Void)! = nil) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
            self.trendNavigationViewController.view.frame.origin.x = targetPositon
            }, completion: completion)
    }
    
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        
        if shouldShowShadow {
            self.trendViewController.view.layer.shadowOpacity = 0.8
        } else {
            self.trendViewController.view.layer.shadowOpacity = 0.0
        }
    }
}

private extension UIStoryboard {
    class func mainStoriboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func menuPanelViewController() -> MenuPanelViewController {
        return (mainStoriboard().instantiateViewController(withIdentifier: "SidePanelViewController") as? MenuPanelViewController)!
    }
}

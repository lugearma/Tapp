//
//  HashtagDetailViewCotroller.swift
//  Tapp
//
//  Created by Luis Arias on 26/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagDetailViewController: UIViewController {
    
    var navbarTitle = ""
    let pageTitle = ["1", "2", "3", "4"]
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleNavbar(navbarTitle)
        setupPageViewController()
    }
    
    func setupPageViewController() {
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        //Create and set view controllers
        let startingViewController = self.viewControllerAtIndex(0)
        let viewControllers: [UIViewController]? = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        //Add controller to view
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.addChildViewController(pageViewController!)
        self.view.addSubview((pageViewController!.view))
        self.pageViewController?.didMoveToParentViewController(self)
        
    }
    
    func viewControllerAtIndex(index: Int) -> PageContentViewController! {
        if self.pageTitle.count == 0 || index >= self.pageTitle.count{
            return nil
        }
        
        //Create new page content
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        pageContentViewController.pageTitle = self.pageTitle[index]
        pageContentViewController.pageIndex = UInt(index)
        
        return pageContentViewController
    }
    
    func setTitleNavbar(title: String) {
        self.title = title
    }
    
}

//MARK: PageViewController data source methods
extension HashtagDetailViewController: UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let view = getCastedViewController(viewController)
        var index = Int((view?.pageIndex)!)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == self.pageTitle.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let view = getCastedViewController(viewController)
        var index = Int((view?.pageIndex)!)
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index -= 1
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitle.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func getCastedViewController(viewController: UIViewController) -> PageContentViewController? {
        return viewController as? PageContentViewController
    }
    
}

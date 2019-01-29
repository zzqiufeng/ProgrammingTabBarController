//
//  ViewController.swift
//  ProgrammingTabBarController
//
//  Created by Qingfeng Liu on 2018-12-16.
//  Copyright © 2018 Qingfeng Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    var statusBarHeight:CGFloat?
    var navHeight:CGFloat?
    var tabHeight:CGFloat?    
    let sideGap = CGFloat(15)
    
    let button1 : UIButton = {
        let bn =  UIButton()
        bn.setTitle("go to tab", for: .normal)
        bn.backgroundColor = .gray
        bn.addTarget(self, action: #selector(presentTab), for: .touchUpInside)
        return bn
    }()
    
    var value = 0 {
        didSet{
            print("value is set to \(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad begins here.")
        getScreenUIdata()
        self.view.backgroundColor = .yellow
        self.view.addSubview(button1)
        
        let button2 = UIButton()
        button2.frame = CGRect(x: sideGap, y: sideGap * 15, width: screenWidth! - sideGap * 2, height: 40)
        button2.setTitle("show viewcontroller2", for: .normal)
        button2.backgroundColor = .gray
        button2.addTarget(self, action: #selector(presentViewController2), for: .touchUpInside)
        self.view.addSubview(button2)
    }
    
    
    @objc func presentTab() {
        print("showing tab")
        //Way one
        let tabController = TabBarViewController()
        //Way two
        //let tabController = showTabBar()
        
        
        self.present(tabController, animated: false, completion: nil)
    }
    
    @objc func presentViewController2() {
        print("showing presentViewController2")
        value = 6
        let viewController2 = ViewController2()
        self.present(viewController2, animated: false, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews begins here.")
        button1.frame = CGRect(x: sideGap, y: statusBarHeight! + navHeight! + sideGap * 5, width: screenWidth! - sideGap * 2, height: 40)
    }
    
    func getScreenUIdata(){
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        statusBarHeight = UIApplication.shared.statusBarFrame.height
        print("screen size width \(String(describing: screenWidth))")
        print("screen size height \(String(describing: screenHeight))")
        print("status bar height \(String(describing: statusBarHeight))")
        if let navgationController = self.navigationController {
            navHeight = navgationController.navigationBar.frame.size.height
            print("navigationBar height \(String(describing: navHeight)) ")
        } else {
            navHeight = CGFloat(0)
            print("There's no navigationBar.")
        }
        if let tabBarController = self.tabBarController {
            tabHeight = tabBarController.tabBar.frame.size.height
            print("tabBar height \(String(describing: tabHeight))")
        } else {
            tabHeight = CGFloat(0)
            print("There's no tabBar.")
        }
    }

}

func showTabBar() -> UITabBarController{
    let tabBarController = UITabBarController()
    let tab0 = UINavigationController(rootViewController: OneViewController())
    let tab1 = TwoViewController()
    let tab2 = ThreeViewController()
    //
    let tabItem0 = UITabBarItem(title: "view0", image: nil, tag: 0)
    let tabItem1 = UITabBarItem(title: "view1", image: nil, tag: 1)
    let tabItem2 = UITabBarItem(title: "view2", image: nil, tag: 2)
    //
    tab0.tabBarItem = tabItem0
    tab1.tabBarItem = tabItem1
    tab2.tabBarItem = tabItem2
    let tabControllers = [tab0,tab1,tab2]
    tabBarController.viewControllers = tabControllers
    return tabBarController
}


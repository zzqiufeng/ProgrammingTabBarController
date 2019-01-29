//
//  TabBarViewController.swift
//  ProgrammingTabBarController
//
//  Created by Qingfeng Liu on 2018-12-16.
//  Copyright © 2018 Qingfeng Liu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TabBar controller begins.")
        self.view.backgroundColor = .red //.green
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("tabbar view will appear")
        // Do any additional setup after loading the view.
        let tab0VC = OneViewController()
        let tab1VC = TwoViewController()
        let tab2VC = ThreeViewController()
        //
        let tab0 = UINavigationController(rootViewController: tab0VC)
        //
        let tabItem0 = UITabBarItem(title: "view0", image: nil, tag: 0)
        let tabItem1 = UITabBarItem(title: "view1", image: nil, tag: 1)
        let tabItem2 = UITabBarItem(title: "view2", image: nil, tag: 2)
        //
        let tabbar = tabBarController?.tabBar
        tabbar?.barTintColor = .black
        tabbar?.backgroundColor =  .yellow
        tabbar?.tintColor = UIColor(red: 43/255, green: 180/255, blue: 0/255, alpha: 1)
        //
        tab0.tabBarItem = tabItem0
        tab1VC.tabBarItem = tabItem1
        tab2VC.tabBarItem = tabItem2
        self.viewControllers = [tab0,tab1VC,tab2VC]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selectd \(tabBarController.selectedIndex)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




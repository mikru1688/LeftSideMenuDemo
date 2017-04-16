//
//  LeftViewController.swift
//  LeftSideMenuDemo
//
//  Created by Frank.Chen on 2017/4/16.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

enum LeftMenu: Int {
    case main
    case secondRunMovie
    case thisWeekMovie
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController: UIViewController, LeftMenuProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var menus = ["Main", "二輪電影", "本週新片"]
    var mainViewController: UIViewController!
    var secondViewController: UIViewController!
    var thisWeekViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewController = UINavigationController(rootViewController: MainViewController())
        
        let secondViewController: SecondRunMovieViewController = SecondRunMovieViewController()
        self.secondViewController = UINavigationController(rootViewController: secondViewController)
        
        let thisWeekViewController: ThisWeekMovieViewController = ThisWeekMovieViewController()
        self.thisWeekViewController = UINavigationController(rootViewController: thisWeekViewController)
        
        // 生成UITableView
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: self.view.frame.size.height), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView.separatorColor = UIColor.black
        self.tableView?.backgroundColor = UIColor(hex: "F1F8E9", alpha: 0.9)
        self.view.addSubview(self.tableView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .secondRunMovie:
            self.slideMenuController()?.changeMainViewController(self.secondViewController, close: true)
        case .thisWeekMovie:
            self.slideMenuController()?.changeMainViewController(self.thisWeekViewController, close: true)
        }
    }
    
    // MARK: - DataSource
    // ---------------------------------------------------------------------
    // 設定表格section的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        cell?.backgroundColor = UIColor.lightGray
        cell?.imageView?.image = UIImage(named: "star")
        cell?.textLabel?.text = self.menus[indexPath.row]
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    // MARK: - Delegate
    // ---------------------------------------------------------------------
    // 設定cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 10
    }
    
    // 點選儲存格事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
}

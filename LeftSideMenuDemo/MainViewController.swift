//
//  ViewController.swift
//  LeftSideMenuDemo
//
//  Created by Frank.Chen on 2017/4/16.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var movieImage = ["movie1", "movie2", "movie3", "movie4", "movie5", "movie6"]
    var movieName = ["玩命關頭8", "柯羅索巨獸", "拆彈專家", "老師有問題", "金權性內幕", "小鎮醫生"]
    var movieReleaseTime = ["2017-04-12", "2017-04-21", "2017-04-21", "2017-04-21", "2017-04-21", "2017-04-14"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Main"
        
        // 生成UITableVeiw
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView?.backgroundColor = UIColor.white
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    // MARK: - DataSource
    // ---------------------------------------------------------------------
    // 設定表格section的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieImage.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none // 選取的時侯無背景色
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator // 細節型態
        cell?.imageView?.image = UIImage(named: self.movieImage[indexPath.row])
        cell?.textLabel?.text = self.movieName[indexPath.row]
        cell?.detailTextLabel?.text = self.movieReleaseTime[indexPath.row]        
        return cell!
    }
    
    // MARK: - Delegate
    // ---------------------------------------------------------------------
    // 設定cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 6
    }
    
    // 點選儲存格事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController: DetailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}

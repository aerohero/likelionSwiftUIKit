//
//  FormTableViewController.swift
//  UIViewDemo
//
//  Created by Sean on 3/13/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    var flag = false
    let toggle = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = .black
        
        setupUI()
    }
    
    func setupUI() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 4
        case 3:
            return 100
        default:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블 뷰 셀 생성
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        // Configure the cell...
        var config = UIListContentConfiguration.subtitleCell()
        config.text = "Section: \(indexPath.section), Row: \(indexPath.row)"
        cell.contentConfiguration = config

        cell.backgroundColor = .systemGray3

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 50
        default:
            return 50
        }
    }
}

#Preview {
  FormTableViewController(style: .insetGrouped)
}

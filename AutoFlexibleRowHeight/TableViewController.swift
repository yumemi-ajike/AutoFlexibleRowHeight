//
//  TableViewController.swift
//  AutoFlexibleRowHeight
//
//  Created by 寺家 篤史 on 2019/04/11.
//  Copyright © 2019 Yumemi Inc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let items = [TableViewCell.Item(title: "Short title",
                                            date: nil,
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Short title",
                                            date: nil,
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Short title",
                                            date: "April 7th, 2019",
                                            description: "The layout of arranged views",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: nil,
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: nil),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: nil,
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: nil,
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image")),
                         TableViewCell.Item(title: "Long title: A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose.",
                                            date: "April 7th, 2019",
                                            description: "The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder.",
                                            imageUrl: URL(string: "https://via.placeholder.com/320x180.png?text=Sample+Image"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(VerticalTableViewCell.self, forCellReuseIdentifier: "vertical")
        tableView.register(HorizontalTableViewCell.self, forCellReuseIdentifier: "horizontal")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "vertical", for: indexPath) as! VerticalTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "horizontal", for: indexPath) as! HorizontalTableViewCell
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! TableViewCell
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }
}


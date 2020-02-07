//
//  ViewController.swift
//  ALWebViewController
//
//  Created by Soner Güler on 02/07/2020.
//  Copyright (c) 2020 Soner Güler. All rights reserved.
//

import UIKit
import ALWebViewController

class ViewController: UITableViewController {
    
    var items: [(title: String, content: ALWebContentType)]?
    
    var html = """
        <html><body><h1> Title </h1><p> Test Html Text</p></body></html>
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            ("Open URL" , .url(url: URL(string: "https://www.google.com")!)),
            ("Open HTML Text", .html(html: html))
        ]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items?[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = items?[indexPath.row].content else {
            return
        }
        
        let webVC = ALWebViewController(content: type)
        navigationController?.pushViewController(webVC, animated: true)
    }
    

}


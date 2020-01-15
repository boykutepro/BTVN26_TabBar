//
//  Messenger.swift
//  DoSomeThings
//
//  Created by Thiện Tùng on 1/15/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class Messenger: UIViewController {
    

    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        createSearchBar()
    }
    func setupTableView(){
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomCellChat.self, forCellReuseIdentifier: "id")
    }
    func createSearchBar() {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Nhập tên người dùng !"
        searchBar.delegate = self as? UISearchBarDelegate
        //searchBar.backgroundColor = .lightGray
        
        self.navigationItem.titleView = searchBar
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
extension Messenger: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // tableView.deleteSections(IndexSet.self, with: .fade)
            //tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.numberOfRows(inSection: 14)
            tableView.reloadData()
        }
    }
    
}
extension Messenger: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomCellChat?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "id") as! CustomCellChat
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "id") as! CustomCellChat
        }
        
        cell?.avt.image = UIImage(named: "avt")
        cell?.nameLabel.text = "James Shainline"
        cell?.mesLabel.text = "Do you free tonight? I want to take you somewhere :)) I miss you so much babe"
        
    
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
}

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
    
    var items: [item] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        createSearchBar()
        fakeData()
    }
    
    func fakeData(){
        let item1 = item(image: "1.2", name: "HIHI HIHIHI", mes: "HIHIHIHI HIH I HIH I HI H IH IH I HI H")
        let item2 = item(image: "anh3", name: "HAHAHA HAHAA", mes: "hahahahahahaahahah")
        let item3 = item(image: "anh4", name: "OHOHOHOHO HOOHo", mes: "OHOHohohohohohn hooo hoo")
        let item4 = item(image: "avt", name: "James Shainline", mes: "Ahiihi hohoh hahahahehehe hihi hohohoho")
        items = [item4, item1, item2, item3, item4, item1, item2, item3, item4, item1, item1, item3, item4, item2, item4, item1]
        
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
            items.remove(at: indexPath.row)
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
        
        cell?.avt.image = UIImage(named: items[indexPath.row].image)
        cell?.nameLabel.text = items[indexPath.row].name
        cell?.mesLabel.text = items[indexPath.row].mes
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}

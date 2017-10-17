//
//  StarWarsViewController.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 15/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class StarWarsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Members
    
    fileprivate var dataSource = [People]()
    private var page = 1
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: - Private
    
    func setup() {
        SVProgressHUD.show()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.requestCharacters()
        
        self.tableView.addInfiniteScroll { (tableView) -> Void in
            StarWarsService.characters(page: self.page, completion: { (error, people) in
                tableView.finishInfiniteScroll()
                if let people = people as? [People] {
                    for character in people {
                        self.dataSource.append(character)
                    }
                    self.tableView.reloadData()
                    self.page = self.page + 1
                }
            })
        }
    }
    
    func requestCharacters() {
        StarWarsService.characters(page: self.page) { (error, people) in
            SVProgressHUD.dismiss()
            if let people = people as? [People] {
                self.dataSource = people
                self.tableView.reloadData()
                self.page = 2
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension StarWarsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath) as! StarWarsTableViewCell
        cell.character = self.dataSource[indexPath.row]
        return cell
    }
}

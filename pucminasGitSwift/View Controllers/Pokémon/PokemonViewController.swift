//
//  PokemonViewController.swift
//  pucminasGitSwift
//
//  Created by Marco Braga on 16/10/17.
//  Copyright © 2017 Marco Braga. All rights reserved.
//

import UIKit
import SVProgressHUD

class PokemonViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Members
    
    fileprivate var dataSource = [PokemonResource]()
    private var offset = 0
    private var selectedIndexPath: IndexPath?
    
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.requestPokemonResources()
        
        self.tableView.addInfiniteScroll { (tableView) -> Void in
            PokemonService.pokemonResources(offset: self.offset, completion: { (error, pokemonResources) in
                tableView.finishInfiniteScroll()
                if let pokemonResources = pokemonResources as? [PokemonResource] {
                    for pokemonResource in pokemonResources {
                        self.dataSource.append(pokemonResource)
                    }
                    self.tableView.reloadData()
                    self.offset = self.offset + 20
                }
            })
        }
    }
    
    func requestPokemonResources() {
        SVProgressHUD.show()
        PokemonService.pokemonResources(offset: self.offset) { (error, pokemonResources) in
            SVProgressHUD.dismiss()
            if let pokemonResources = pokemonResources as? [PokemonResource] {
                self.dataSource = pokemonResources
                self.tableView.reloadData()
                self.offset = 20
            }
        }
    }
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetails" {
            guard let pokemonDetailsViewController = segue.destination as? PokemonDetailsViewController else { return }
            guard let selectedIndexPath = self.selectedIndexPath else { return }
            pokemonDetailsViewController.pokemonResource = self.dataSource[selectedIndexPath.row]
            self.selectedIndexPath = nil
        }
     }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.pokemonResource = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "PokemonDetails", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  ViewController.swift
//  UITableViewSearchBar
//
//  Created by marco rodriguez on 01/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    
    
    @IBOutlet weak var searchBarFrutas: UISearchBar!
    @IBOutlet weak var tablaFrutas: UITableView!
    
    let fruits = ["Melon","Jicama","Manzana", "Pera","Mango", "Limon", "Pepino", "Uva","Sandia", "Guayaba","Aguacate","Papaya", "Frambuesa"]
    var frutaFiltrada: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarFrutas.delegate = self
        
        frutaFiltrada = fruits
    }

    // MARK: - SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        frutaFiltrada = []
        
        if searchText == "" {
            frutaFiltrada = fruits
        } else {
        
        for fruta in fruits {
            if fruta.lowercased().contains(searchText.lowercased()){
                
                frutaFiltrada.append(fruta)
            }
        }
        }
        self.tablaFrutas.reloadData()
    }
    
    // MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutaFiltrada.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaFrutas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = frutaFiltrada[indexPath.row]
        return celda
    }

}


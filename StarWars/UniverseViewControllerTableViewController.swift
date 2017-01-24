//
//  UniverseViewControllerTableViewController.swift
//  StarWars
//
//  Created by Eugenio Barquín on 23/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit

class UniverseViewControllerTableViewController: UITableViewController {
    
    //MARK: - Properties
    let model : StarWarsUniverse
    
    
    
    //MARK: - Initialization
    init(model: StarWarsUniverse){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

       // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //Incomplete implementation, return the number of sections
        return model.affiliationCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Incomplete implementation, return the number of rows
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return model.affiliationName(getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Definir un id para el tipo de celda
        let  cellId = "StarWarsCell"
        
        //Averiguar la afiliación
        let aff = getAffiliation(forSection: indexPath.section)
        
        //Averiguar quien es el personaje
        let char = model.character(atIndex: indexPath.row, forAffiliation: aff)
        
        //Crear la celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil{
            //El opcional está vacio y toca crear la celda desde cero
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        //Configurarla
        cell?.imageView?.image = char.photo
        cell?.textLabel?.text = char.alias
        cell?.detailTextLabel?.text = char.name
        
        //Devolverla
        return cell!
    }
    

    //MARK: - Utils
    func getAffiliation(forSection section: Int) ->StarWarsAffiliation{
    
        var aff: StarWarsAffiliation = .unknow
        
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .jabbaCriminalEmpire
        case 3:
            aff = .firstOrder
        default:
            aff = .unknow
        }
        
        return aff
    }
    
    
}

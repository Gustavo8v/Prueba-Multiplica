//
//  TableViewAeropuertos.swift
//  Multiplica
//
//  Created by Gustavo Gutierrez on 15/01/21.
//

import UIKit
import Alamofire

class TableViewAeropuertos: UIViewController {
    
    
    var infoAeropuertos: [AeropuertosList] = []
    
    
    
    //MARK : - Referencias UI
    @IBOutlet weak var aeroTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aeroTableView.dataSource = self
        aeroTableView.delegate = self
        aeroTableView.register(UINib(nibName: "TableViewCellAero", bundle: nil), forCellReuseIdentifier: "aero-cell")
        
    }
    
    
  
    
}


//MARK: - TableView Delegate
extension TableViewAeropuertos: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = aeroTableView.dequeueReusableCell(withIdentifier: "aero-cell",
                                                    for: indexPath)
    
      // (cell as? TableViewCellAero)?.setUpCell(aeropuerto: aeropuerto, direccion: direccion, distancia: distancia)
      /* let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "aero-cell")
        cell.textLabel?.text = infoAeropuertos[indexPath.row].nombreAeropuerto
        cell.textLabel?.text = infoAeropuertos[indexPath.row].distanciaAeropuerto
        cell.textLabel?.text = infoAeropuertos[indexPath.row].distanciaAeropuerto
      */
        
        cell.textLabel?.text = infoAeropuertos[indexPath.row].nombreAeropuerto
        cell.detailTextLabel?.text = infoAeropuertos[indexPath.row].direccionAeropuerto
        //cell.textLabel?.text = infoAeropuertos[indexPath.row].distanciaAeropuerto
        
        return cell
    }
    
}

//MARK: - TableView DetaSource
extension TableViewAeropuertos: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fue Seleccionada")
    }
    

    
    
}



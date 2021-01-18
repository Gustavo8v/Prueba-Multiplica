//
//  TableViewCellAero.swift
//  Multiplica
//
//  Created by Gustavo Gutierrez on 15/01/21.
//

import UIKit
import Alamofire




class TableViewCellAero: UITableViewCell {
    
//MARK: - Referencias UI
  
    @IBOutlet weak var aeroImageView: UIView!
    @IBOutlet weak var aeropuertoText: UILabel!
    @IBOutlet weak var direccionText: UILabel!
    @IBOutlet weak var distanciaText: UILabel!
    
    
    
//MARK : - Funcionnes
    override func awakeFromNib() {
        super.awakeFromNib()
        aeroImageView.clipsToBounds = true
        aeroImageView.layer.cornerRadius = aeroImageView.frame.width / 2
        
    }

    
    
    
    private func fetchService() {
        let endpointString = "https://www.mocky.io/v2/5e2674472f00002800a4f417"
        guard let endponit = URL(string: endpointString) else {
            return
        }
        
        
        AF.request(endponit, method: HTTPMethod.get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            if response.error != nil {
                print("Hubo un error")
                
                return
            }
            
            guard
                let dataFromService = response.data,
                let model: AeropuertosList = try? JSONDecoder().decode(AeropuertosList.self, from: dataFromService) else {
                return
            }
                
                
            DispatchQueue.main.async {
                self.aeropuertoText.text = model.nombreAeropuerto
                self.direccionText.text = model.direccionAeropuerto
                self.distanciaText.text = model.distanciaAeropuerto
            }
        
        }
    }
    
  /*  func setUpCell(aeropuerto: Any, direccion: Any, distancia: Any){
        aeropuertoText.text = aeropuerto as? String
        direccionText.text = direccion as? String
        distanciaText.text = distancia as? String
    }
 */
}



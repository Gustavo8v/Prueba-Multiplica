//
//  RadioAeropuertos.swift
//  Multiplica
//
//  Created by Gustavo Gutierrez on 15/01/21.
//

import UIKit



class RadioAeropuertos: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    static var distance: Double = 0
    
  
    //MARK: - Referencias UI
    @IBOutlet weak var airportText: UILabel!
    @IBOutlet weak var finderText: UILabel!
    @IBAction func sliderKm(_ sender: UISlider) {
        kmLabel.text = String(Int(sender.value))
        RadioAeropuertos.distance = Double(sender.value) 
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
    }
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var distanciaKilometrosLabel: UILabel!
    

    
  
        
}



//
//  Place.swift
//  Weather App
//
//  Created by Phammel on 10/31/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import Foundation
import UIKit


class Place
{
    
    var hoursForPlace = [Hour]()
   
    var lat : Double
    
    var lon : Double
    
    var name : String
    
    var country : String
    
    var id: Int
    
    
    
    init(array: [Hour], lat : Double, lon: Double, name: String, county: String, id : Int )
    {
        self.hoursForPlace = array
        
        self.lat = lat
        
        self.lon = lon
        
        self.name = name
        
        self.country = county
        
        self.id = id
        
    }
    
    
    
    
    
    
    
}


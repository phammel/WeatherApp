//
//  Hour.swift
//  Weather App
//
//  Created by Phammel on 10/31/16.
//  Copyright © 2016 Phammel. All rights reserved.
//
import Foundation
import UIKit


class Hour
{
    
    var tempF : Double
    
    var humidity: Double
    
    var description: String
    
    var windSpeed: Double
    
    var windDirection: String
    
    var Ttime: String
    
    var image: UIImage
    
   
    
    
    init(tempK: Double, humidity: Double, description: String, windSpeed: Double, WindAngle: Double, Ftime: String, ImageString: String)
    {
        //T(°F) = T(K) × 9/5 - 459.67
        self.tempF = tempK * (9 / 5) - 459.67
        
        self.humidity = humidity
        
        self.description = description
        
        
        self.windSpeed = windSpeed
        
        //Change the angle from number to String
        if (WindAngle == 0)
        {
            windDirection = "N"
        }
        else if (WindAngle > 0 && WindAngle < 90)
        {
            windDirection = "NE"
        }
        else if (WindAngle == 90)
        {
            windDirection = "E"
        }
        else if (WindAngle > 90 && WindAngle < 180)
        {
            windDirection = "SE"
        }
        else if (WindAngle == 180)
        {
            windDirection = "S"
        }
        else if (WindAngle > 180 && WindAngle < 270)
        {
            windDirection = "SW"
        }
        else if (WindAngle == 270)
        {
            windDirection = "W"
        }
        else if (WindAngle > 270 && WindAngle < 360)
        {
            windDirection = "NW"
        }
        else
        {
            windDirection = "N"
        }
        
        Ttime = Ftime
        
        // change the time and date string in 24 hour time to 12 hour time
        if Ftime.rangeOfString("00:00:00") != nil
        {
            Ttime = "12:00AM"
        }
        if Ftime.rangeOfString("01:00:00") != nil
        {
            Ttime = "1:00AM"
        }
        if Ftime.rangeOfString("02:00:00") != nil
        {
            Ttime = "2:00AM"
        }
        if Ftime.rangeOfString("03:00:00") != nil
        {
            Ttime = "3:00AM"
        }
        if Ftime.rangeOfString("04:00:00") != nil
        {
            Ttime = "4:00AM"
        }
        if Ftime.rangeOfString("05:00:00") != nil
        {
            Ttime = "5:00AM"
        }
        if Ftime.rangeOfString("06:00:00") != nil
        {
            Ttime = "6:00AM"
        }
        if Ftime.rangeOfString("07:00:00") != nil
        {
            Ttime = "7:00AM"
        }
        if Ftime.rangeOfString("08:00:00") != nil
        {
            Ttime = "8:00AM"
        }
        if Ftime.rangeOfString("9:00:00") != nil
        {
            Ttime = "9:00AM"
        }
        if Ftime.rangeOfString("10:00:00") != nil
        {
            Ttime = "10:00AM"
        }
        if Ftime.rangeOfString("11:00:00") != nil
        {
            Ttime = "11:00AM"
        }
        if Ftime.rangeOfString("12:00:00") != nil
        {
            Ttime = "12:00PM"
        }
        if Ftime.rangeOfString("13:00:00") != nil
        {
            Ttime = "1:00PM"
        }
        if Ftime.rangeOfString("14:00:00") != nil
        {
            Ttime = "2:00PM"
        }
        if Ftime.rangeOfString("15:00:00") != nil
        {
            Ttime = "3:00PM"
        }
        if Ftime.rangeOfString("16:00:00") != nil
        {
            Ttime = "4:00PM"
        }
        if Ftime.rangeOfString("17:00:00") != nil
        {
            Ttime = "5:00PM"
        }
        if Ftime.rangeOfString("18:00:00") != nil
        {
            Ttime = "6:00PM"
        }
        if Ftime.rangeOfString("19:00:00") != nil
        {
            Ttime = "7:00PM"
        }
        if Ftime.rangeOfString("20:00:00") != nil
        {
            Ttime = "8:00PM"
        }
        if Ftime.rangeOfString("21:00:00") != nil
        {
            Ttime = "9:00PM"
        }
        if Ftime.rangeOfString("22:00:00") != nil
        {
            Ttime = "10:00PM"
        }
        if Ftime.rangeOfString("23:00:00") != nil
        {
            Ttime = "11:00PM"
        }
        if Ftime.rangeOfString("24:00:00") != nil
        {
            Ttime = "12:00AM"
        }
        
        
        
        
        
        
        
        
        
        // set the image to the image corrisponding to the code API gives us 
        if (ImageString == "01d")
        {
            self.image = UIImage(named: "01d")!
        }
        else if (ImageString == "01n")
        {
            self.image = UIImage(named: "01n")!
        }
        else if (ImageString == "02d")
        {
            self.image = UIImage(named: "02d")!
        }
        else if (ImageString == "02n")
        {
            self.image = UIImage(named: "02n")!
        }
        else if (ImageString == "03d")
        {
            self.image = UIImage(named: "03d")!
        }
        else if (ImageString == "03n")
        {
            self.image = UIImage(named: "03n")!
        }
        else if (ImageString == "04d")
        {
            self.image = UIImage(named: "04d")!
        }
        else if (ImageString == "04n")
        {
            self.image = UIImage(named: "04n")!
        }
        else if (ImageString == "09d")
        {
            self.image = UIImage(named: "09d")!
        }
        else if (ImageString == "09n")
        {
            self.image = UIImage(named: "09n")!
        }
        else if (ImageString == "10d")
        {
            self.image = UIImage(named: "10d")!
        }
        else if (ImageString == "10n")
        {
            self.image = UIImage(named: "10n")!
        }
        else if (ImageString == "11d")
        {
            self.image = UIImage(named: "11d")!
        }
        else if (ImageString == "11n")
        {
            self.image = UIImage(named: "11n")!
        }
        else if (ImageString == "13d")
        {
            self.image = UIImage(named: "13d")!
        }
        else if (ImageString == "13n")
        {
            self.image = UIImage(named: "13n")!
        }
        else if (ImageString == "50d")
        {
            self.image = UIImage(named: "50d")!
        }
        else
        {
        self.image = UIImage(named: "50n")!
        }
        
        
        
       
        
    }
    
    
}


//
//  ViewController.swift
//  Weather App
//
//  Created by Phammel on 10/25/16.
//  Copyright © 2016 Phammel. All rights reserved.
//
//1. Briefly explain the purpose of your app
//
//      To give the current weather and the future weather for barrington
//
//
//2. Describe the process for acquiring the API for your app.
//    
//         I googled weather APIs and this was one of the free ones, i had to make a free acount to get the access code
//
//3. What data are your using from the API?
//
//          I am pulling the current temp, humidity, windSpeed, WindAngle, what image to use and a description from one API site and i am pulling the future temp, humidity, windSpeed, WindAngle, what image to use and a description and what time its for from another API site
//
//4. How many hours did you honestly put into this project (we had roughly 12 in class hours)?
//
//         i worked on it for 10 hours but i didn't get a lot done.
//
//5. Comment your app, explaining your steps through the process.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //***************************************************************************************************
    // vars
    //***************************************************************************************************

    @IBOutlet weak var tableview: UITableView!
    
    var hourArray = [Hour]()
    var current : Hour?
   
    
    
    //***************************************************************************************************
    // view did
    //***************************************************************************************************

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        

        getready() //gets ready to parse
        getReadyAgain() //gets ready to parse from the other site
        
      
    }//view did
    
    
    //***************************************************************************************************
    // get ready
    //***************************************************************************************************

    
    func getready()
    {
       //gets ready to parse from the site for futrure forcast
        
            let urlString = "http://api.openweathermap.org/data/2.5/forecast/city?id=4884116&APPID=482378b9dff53868bce8ac7c44e7b278"
            
            if let url = NSURL(string: urlString)
            {
                if let myData = try? NSData(contentsOf: url as URL, options: [])
                {
                    let json = JSON(data:  myData as Data)
                    
                    
                    parse(json)
                    
                    
                    
                }

            }
      
    }
    
    
    //***************************************************************************************************
    // get ready X2
    //***************************************************************************************************

    
    func getReadyAgain()
    {
        //gets ready to parse from the site for current forcast

        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?id=4884116&appid=482378b9dff53868bce8ac7c44e7b278"
        
        if let url = NSURL(string: urlString)
        {
            if let myData = try? NSData(contentsOf: url as URL, options: [])
            {
                let json = JSON(data:  myData as Data)
                
                
                parseAgian(json)
                
                
                
            }
            
        }

    }
    
    //***************************************************************************************************
    // parse X2
    //***************************************************************************************************

    
    func parseAgian(json: JSON)
    {
       
        
            //parses from the site for current forcast

            
            let tempK = json["main"]["temp"].doubleValue
            let humidity = json["main"]["humidity"].doubleValue
            let description = json["weather"].arrayValue[0]["description"].stringValue
            let windSpeed = json["wind"]["speed"].doubleValue
            let WindAngle = json["wind"]["deg"].doubleValue
            let Ftime = json["dt_txt"].stringValue
            let ImageString = json["weather"].arrayValue[0]["icon"].stringValue
            
            //makes an hour
            
            current = Hour(tempK: tempK, humidity: humidity, description: description, windSpeed: windSpeed, WindAngle: WindAngle, Ftime: Ftime, ImageString: ImageString)
            
        
        

    }
    
    
    //***************************************************************************************************
    // parse
    //***************************************************************************************************

    
    
    func parse(json: JSON)
    {
        
        for result in json["list"].arrayValue
        {
            
            let tempK = result["main"]["temp"].doubleValue
            let humidity = result["main"]["humidity"].doubleValue
            let description = result["weather"].arrayValue[0]["description"].stringValue
            let windSpeed = result["wind"]["speed"].doubleValue
            let WindAngle = result["wind"]["deg"].doubleValue
            let Ftime = result["dt_txt"].stringValue
            let ImageString = result["weather"].arrayValue[0]["icon"].stringValue
          
            //makes hour for each of the futrure hours and adds to an array of hours
            
            let obj = Hour(tempK: tempK, humidity: humidity, description: description, windSpeed: windSpeed, WindAngle: WindAngle, Ftime: Ftime, ImageString: ImageString)
            
            hourArray.append(obj)
            
            
        }


    }//parse real
    
    
    
    //***************************************************************************************************
    // cell for row
    //***************************************************************************************************

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        
        
        if (indexPath.row == 0 ) //if its the first cell set to the current forcast
        {
            let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
            
            //format number to have 2 decimal places
            let temp = String(format: "%.2f", (current?.tempF)!)
            let humid = String(format: "%.2f", (current?.humidity)!)
            let speed = String(format: "%.2f", (current?.windSpeed)!)
            
            //set cell text to display info
            Cell.textLabel!.text = "Current Weather: \n\(current!.description) \nTempature: \(temp) \nHumidity: \(humid) \nWind: \(speed)\(current!.windDirection) "
            
            
            
            Cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 20.0)
            Cell.detailTextLabel?.text = "Future Forecast:"
            
            
            //give cell an image of the weather
            Cell.imageView?.image = current!.image
            
            
            //--- use this to make the frame for the image larger so image can be scaled up
            let itemSize = CGSizeMake(100, 100);
            UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
            let imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
            Cell.imageView?.image!.draw(in: imageRect)
            Cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
            //---
            
            //make image scale to fit the imageview
            Cell.imageView?.contentMode = .scaleAspectFit
            
            
           
            
            return Cell


        }
        else // set the cell to display one of the hours 
        {
          
            //sets each cell in the table view with info for a staion from the staion array
            let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
            //format number to have 2 decimal places
            let temp = String(format: "%.2f", hourArray[indexPath.row - 1].tempF)
            let humid = String(format: "%.2f", hourArray[indexPath.row - 1].humidity)
            let speed = String(format: "%.2f", hourArray[indexPath.row - 1].windSpeed)
        
            //set cell text to display info for the correct hour
            Cell.textLabel!.text = "\(hourArray[indexPath.row - 1].Ttime) \n\(hourArray[indexPath.row - 1].description) \nTempature: \(temp) \nHumidity: \(humid) \nWind: \(speed)\(hourArray[indexPath.row - 1].windDirection)"
            Cell.detailTextLabel?.text = ""
            
            
            //give cell an image of the weather
            Cell.imageView?.image = hourArray[indexPath.row - 1].image

        
            //--- use this to make the frame for the image larger so image can be scaled up
            let itemSize = CGSizeMake(100, 100);
            UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
            let imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
            Cell.imageView?.image!.draw(in: imageRect)
            Cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
            //---
            
            //make image scale to fit the imageview
            Cell.imageView?.contentMode = .scaleAspectFit
        
        
            
               
            return Cell
        }
        
    }//cellforrow
    
    
    //***************************************************************************************************
    // number of rows
    //***************************************************************************************************

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return hourArray.count + 1
    }//numberofrows
    
    
    
    
}


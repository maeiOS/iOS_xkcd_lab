//
//  ViewController.swift
//  xkcd-lab
//
//  Created by 킷탄 on 2015-03-23.
//  Copyright (c) 2015 Team404. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UILabel!
    
    let e = M_E
    var data: NSMutableData!
    var stringArray: [String]!
    
    //var today = NSDate()
    //var currentYear = Int()
    

    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let today = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitMonth | .CalendarUnitYear, fromDate: today)
        ///currentYear = components.year
        let currentMonth = components.month
        
        var formatter = NSDateFormatter()
        var percentage: Double = 0.0
        var someTime: Double = 0.0
        
        //formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.dateFormat = "yyyy"
        var currentYear = formatter.stringFromDate(today)
        
        //date.text = formatter.stringFromDate(today)
        
        //percentage = sqrt((log( + pow(e, 3.0)-3)/(20.3444)))
        
        
        
        var p = 0.0
        
        var e3 = exp(3.0)
        
        var expo = (20.3444 * (pow(p, 3.0))) + 3.0
        
        var eterms = exp(expo) - e3
        
        someTime = 2015 - eterms
        let truncDate = Int(someTime)
        let dateAsString = String(format:"%f", truncDate)
        date.text = String(format:"%f", dateAsString)
        //date.text = String(format: "%f", currentMonth)
        
//        let urlPath: String = "http://en.wikipedia.org/wiki/2014"
//        var url: NSURL = NSURL(string: urlPath)!
//        var request1: NSURLRequest = NSURLRequest(URL: url)
//        let queue:NSOperationQueue = NSOperationQueue()
//        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
//            var err: NSError
//            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//            println("AsSynchronous\(jsonResult)")
//        })
        
        
        
//        printString = String(NSString(data: data, encoding: NSUTF8StringEncoding)!).stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil))
        
        
        let url = NSURL(string: "http://en.wikipedia.org/w/api.php?action=query&explaintext=&prop=extracts&format=json&titles=2015")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            println(String(NSString(data: data, encoding: NSUTF8StringEncoding)!).stringByReplacingOccurrencesOfString("[^[^<>]+>", withString: "", options: .RegularExpressionSearch, range: nil))
            
            self.date.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!).stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        }
        
        
        
        
    }
//    
//    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
//        self.data?.appendData(data)
//    }
//    
//    
//    func connectionDidFinishLoading(connection: NSURLConnection!)
//    {
//        var error: NSErrorPointer=nil
//        
//        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: error) as NSDictionary
//        
//        println(jsonResult)
//        
//        
//        var dersler : NSArray = jsonResult.valueForKey("tbl_aboutus") as NSArray
//        
//        println(dersler)
//        
//        
//        for vartype : AnyObject in dersler
//        {
//            var dersler1 : NSString = vartype.valueForKey("abtus_desc") as NSString
//            
//            
//            stringArray .addObject(dersler1)
//            
//        }
//        
//        
//        println(stringArray)
//        
//        
//        
//        
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


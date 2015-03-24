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
    //var data: NSMutableData!
    //var stringArray: [String]!
    //var today = NSDate()
    //var currentYear = Int()
    

    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        
        var today = NSDate()
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy"
        var currentYear = formatter.stringFromDate(today)
        var yearAsDouble = (currentYear as NSString).doubleValue
        
        var someTime: Double = 0.0
 
        var p = 0.0
        var e3 = exp(3.0)
        var expo = (20.3444 * (pow(p, 3.0))) + 3.0
        var eterms = exp(expo) - e3
        
        someTime = yearAsDouble - eterms
        var truncDate = Int(someTime)
        var dateAsString = String(format:"%d", truncDate)
        
        date.text = dateAsString
        
        super.viewDidLoad()
        
//date.text = String(format:"%f", dateAsString)
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
        
        
        let url = NSURL(string: "http://en.wikipedia.org/w/api.php?action=query&explaintext=&prop=extracts&format=json&titles=2014")
        let request = NSURLRequest(URL: url!)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil;
        var error: NSErrorPointer = nil
        var dataVal: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: nil)!
        var err: NSError
        //var jsonResult: NSDictionary = NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            var extraction: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        /*
        let resstr = NSString(data: dataVal, encoding: NSUTF8StringEncoding)

        let weirdNumberExtractor = extraction.valueForKeyPath("query.pages") as String
        let array = NSString(format: resstr!, locale: nil).componentsSeparatedByString("pages\":{\"")
            .map { $0.componentsSeparatedByString("\":{\"pageid\") }")}
            .filter { $0.count > 1 }
            .map { $0[0] }
        
        println(array)
        */
        
        let parse = extraction.valueForKeyPath("query.pages.48630.extract") as String
        //println(parse);
        let eventIndex = parse.rangeOfString("== Events ==")
        let birthIndex = parse.rangeOfString("== Births ==")
        //println(eventIndex?.startIndex);
        //println(birthIndex?.endIndex);
        
        let range = Range<String.Index>(start: eventIndex!.endIndex as String.Index, end: birthIndex!.startIndex as String.Index);
        let events = parse.substringWithRange(range);
        let splits = split(events) {$0 == "\n"}
        
        var counter: UInt32 = 0
        for line in splits {
            counter += 1
        }
        
        let index = (Int)(arc4random_uniform(counter - 1))
        var randomEvent = splits[index]
        
        println(randomEvent)
        
        
        //(String(NSString(data: data, encoding: NSUTF8StringEncoding)!).stringByReplacingOccurrencesOfString("[^[^<>]+>", withString: "", options: .RegularExpressionSearch, range: nil))
        
            //self.date.text = String(NSString(data: data, encoding: NSUTF8StringEncoding)!).stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
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


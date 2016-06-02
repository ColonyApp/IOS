//
//  CallWebService.swift
//  ColonyApp
//
//  Created by 川守田敦史 1 on 2016/05/26.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//

import Foundation
//import AzureHeader

class CallWebService: NSXMLParser{
    
    //func data2string(data: NSData)->String?{
    //    return NSString(data: data, encoding: NSUTF8StringEncoding) as? String
    //}
    
    func CallHelloWorld()->NSString?{

        let soapMessage = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><HelloWorld xmlns=\"http://colonywebappdb.azurewebsites.net/\" /></soap:Body></soap:Envelope>"

        
        let soapMessageLength = soapMessage.characters.count

        let url:String = "http://colonywebappdb.azurewebsites.net/WebService1.asmx"
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        _ = NSURLSession.sharedSession()
        //let error : NSError?
        
        request.HTTPMethod = "POST"
        request.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding)
        request.addValue("colonywebappdb.azurewebsites.net", forHTTPHeaderField: "Host")
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(String(soapMessageLength), forHTTPHeaderField: "Content-Length")
        request.addValue("http://colonywebappdb.azurewebsites.net/HelloWorld", forHTTPHeaderField: "SOAPAction")

        var result: NSString?
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error in
            if (error == nil) {
                result = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("result:\(result)")
                
            } else {
                print("\(error)")
            }
        })
        task.resume()
        return result
    }
    func CallHelloWorld2(url: String)->String{
        var returnValue = ""
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string : url)!,
                                           completionHandler:{(data, response, error) in
                                            
                                            dispatch_async(dispatch_get_main_queue(),{
                                                if error == nil && data != nil {
                                                    returnValue = (NSString(data: data!, encoding: NSUTF8StringEncoding) as? String)!
                                                    print("result3:[\(returnValue)]")
                                                }else{
                                                    print(error!.description)
                                                }
                                            })
        })
        task.resume()
        return returnValue
    }
    func CallHelloWorld3()->NSString?{
        
        let soapMessage = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><HelloWorld xmlns=\"http://colonywebappdb.azurewebsites.net/\" /></soap:Body></soap:Envelope>"
        
        
        let soapMessageLength = soapMessage.characters.count
        
        let url:String = "http://colonywebappdb.azurewebsites.net/WebService1.asmx"
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        _ = NSURLSession.sharedSession()
        //let error : NSError?
        
        request.HTTPMethod = "POST"
        request.HTTPBody = soapMessage.dataUsingEncoding(NSUTF8StringEncoding)
        request.addValue("colonywebappdb.azurewebsites.net", forHTTPHeaderField: "Host")
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(String(soapMessageLength), forHTTPHeaderField: "Content-Length")
        request.addValue("http://colonywebappdb.azurewebsites.net/HelloWorld", forHTTPHeaderField: "SOAPAction")
        
        var result: NSString?
        var json: NSDictionary!
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error in
            if (error == nil) {
                result = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("result3:\(result)")
                do{
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                    let response:NSDictionary = json.objectForKey("response") as! NSDictionary
                    let station:NSArray = response.objectForKey("station") as! NSArray
                    
                    for var i=0 ; i < station.count ; i++ {
                        print(station[i].objectForKey("prefecture") as! NSString)
                    }
                }catch{
                    print("\(error)")
                }
            } else {
                print("\(error)")
            }
        })
        task.resume()
        return result
    }

}



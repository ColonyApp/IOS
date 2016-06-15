//
//  MainViewController.swift
//  Colony
//
//  Created by 川守田敦史 1 on 2016/06/15.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if IsExistsUserGroupChainByName("", groupName: "") == true{
            print("true")
        }else{
            print("false")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func IsExistsUserGroupChainByName(nickname: String, groupName: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/IsExistsUserGroupChainByName"
        let parameter = [
            "nickname":nickname,
            "groupName01":groupName
        ]
        var returnValue : Bool = false
        Alamofire.request(.POST, url, parameters: parameter)
            .responseJSON{response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    if json == "true" {
                        returnValue = true
                    } else {
                        returnValue = false
                    }
                case .Failure(let _):
                    print("error")
                    returnValue = false
                }
        }
        return returnValue
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

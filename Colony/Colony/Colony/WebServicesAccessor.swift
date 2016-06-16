//
//  WebServicesAccessor.swift
//  Colony
//
//  Created by 川守田敦史 1 on 2016/06/16.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebServicesAccessor{
    
    func CreateGroupId() -> String {
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/CreateGroupId"
        var returnValue : String = ""
        Alamofire.request(.GET, url)
            .responseJSON{response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    returnValue = json.string!
                case .Failure( _):
                    returnValue = ""
                }
        }
        return returnValue
    }

    func CreateTargetId() -> String {
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/CreateTargetId"
        var returnValue : String = ""
        Alamofire.request(.GET, url)
            .responseJSON{response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    returnValue = json.string!
                case .Failure( _):
                    returnValue = ""
                }
        }
        return returnValue
    }

    func CreateUser(nickname: String, mailAddress: String, groupName: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/CreateUser"
        let parameter = [
            "nickname":nickname,
            "mailAddress":mailAddress,
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
                case .Failure( _):
                    print("error")
                    returnValue = false
                }
        }
        return returnValue
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
                case .Failure( _):
                    print("error")
                    returnValue = false
                }
        }
        return returnValue
    }
}


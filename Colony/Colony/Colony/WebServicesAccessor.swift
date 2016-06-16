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

    func CreateUserId() -> String {
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/CreateUserId"
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

    func GetGroupIdByGroupName(groupName: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/GetGroupIdByGroupName"
        let parameter = [
            "groupName":groupName
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

    func GetUserIdByMailAddress(mailAddress: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/GetUserIdByMailAddress"
        let parameter = [
            "mailAddress":mailAddress
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

    func IsExistsGroup(groupName: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/IsExistsGroup"
        let parameter = [
            "groupName":groupName
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

    func IsExistsUser(nickname: String, mailAddress: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/IsExistsUser"
        let parameter = [
            "nickname":nickname,
            "mailAddress":mailAddress
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

    func ModifyMailAddress(userId: String, oldMailAddress: String, newMailAddress: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/ModifyMailAddress"
        let parameter = [
            "userId":userId,
            "oldMailAddress":oldMailAddress,
            "newMailAddress":newMailAddress
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

    func ModifyNickName(userId: String, oldNickName: String, newNickName: String)->Bool{
        let url = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/ModifyNickName"
        let parameter = [
            "userId":userId,
            "oldNickname":oldNickName,
            "newNickname":newNickName
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


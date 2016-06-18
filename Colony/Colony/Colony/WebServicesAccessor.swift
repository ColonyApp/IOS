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
    
    //定数
    let BASE_URL: String = "http://colonywebappdb.azurewebsites.net/WebService1.asmx/"
    let MODIFY_NICKNAME: String = "ModifyNickName"
    let MODIFY_MAILADDRESS: String = "ModifyMailAddress"
    let IS_EXISTS_USER_GROUP_CHAIN_BY_NAME: String = "IsExistsUserGroupChainByName"
    let IS_EXISTS_USER: String = "IsExistsUser"
    let IS_EXISTS_GROUP: String = "IsExistsGroup"
    let GET_USER_BY_MAILADDRESS: String = "GetUserIdByMailAddress"
    let GET_GROUPID_BY_GROUPNAME: String = "GetGroupIdByGroupName"
    let CREATE_USER_ID: String = "CreateUserId"
    let CREARE_USER: String = "CreateUser"
    let CREATE_TARGET_ID: String = "CreateTargetId"
    let CREATE_GROUP_ID: String = "CreateGroupId"
    
    init(){
        
    }
    
    func CreateGroupId() -> String {
        let url = BASE_URL + CREATE_GROUP_ID
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
        let url = BASE_URL + CREATE_TARGET_ID
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
        let url = BASE_URL + CREARE_USER
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
        let url = BASE_URL + CREATE_USER_ID
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
        let url = BASE_URL + GET_GROUPID_BY_GROUPNAME
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
        let url = BASE_URL + GET_USER_BY_MAILADDRESS
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
        let url = BASE_URL + IS_EXISTS_GROUP
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
        let url = BASE_URL + IS_EXISTS_USER
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
        let url = BASE_URL + IS_EXISTS_USER_GROUP_CHAIN_BY_NAME
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
        let url = BASE_URL + MODIFY_MAILADDRESS
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
        let url = BASE_URL + MODIFY_NICKNAME
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


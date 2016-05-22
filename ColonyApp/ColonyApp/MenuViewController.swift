//
//  MenuViewController.swift
//  ColonyApp
//
//  Created by 川守田敦史 1 on 2016/05/15.
//  Copyright © 2016年 Atsushi Kawamorita. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    /* 定数 */
    //実装開始年
    let IMPLIMENTAL_YEAR: String = "2016"
    //年のフォーマット
    let YEAR_STRING_FORMAT: String = "yyyy"
    //画面遷移のアニメーション効果
    let UIMODALTRANSITIONSTYLE_PARTIALCURL: UIModalTransitionStyle = UIModalTransitionStyle.PartialCurl
    let UIMODALTRANSITIONSTYLE_FLIPHORIZONTAL:UIModalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    //tag
    let TAG_CONFIG_IMAGE_BUTTON: Int = 0
    let TAG_WANT_BUTTON: Int = 1
    let TAG_GET_BUTTON: Int = 2
    let TAG_GIVE_BUTTON: Int = 3
    let TAG_SEARCH_BUTTON: Int = 5
    let TAG_COPYLIGHT_LABEL: Int = 4
    //コピーライト文言
    let COPYLIGHT_C: String = "Copyright (C)"
    let AUTOR_NAME: String = "Atsushi KAWAMORITA"
    let ALLRIGHTRESERVED: String = "All Rights Reserved."
    
    /* 変数 */
    @IBOutlet weak var ConfigImageButton: UIButton!
    @IBOutlet weak var WantButton: UIButton!
    @IBOutlet weak var GetButton: UIButton!
    @IBOutlet weak var GiveButton: UIButton!
    @IBOutlet weak var SeachButton: UIButton!
    @IBOutlet weak var CopyLigjtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* TAG */
        ConfigImageButton.tag = TAG_CONFIG_IMAGE_BUTTON
        WantButton.tag = TAG_WANT_BUTTON
        GetButton.tag = TAG_GET_BUTTON
        GiveButton.tag = TAG_GIVE_BUTTON
        SeachButton.tag = TAG_SEARCH_BUTTON
        CopyLigjtLabel.tag = TAG_COPYLIGHT_LABEL
 
        /* 位置 */
        let xPosition: CGFloat = (self.view.frame.width)/2
        var yPosition: CGFloat = 30
        ConfigImageButton.layer.position = CGPoint(x: xPosition, y:yPosition)
        yPosition = 65
        WantButton.layer.position = CGPoint(x: xPosition, y: yPosition)
        yPosition = 180
        GetButton.layer.position = CGPoint(x: xPosition, y: yPosition)
        yPosition = 295
        SeachButton.layer.position = CGPoint(x: xPosition, y: yPosition)
        yPosition = 410
        GiveButton.layer.position = CGPoint(x: xPosition, y: yPosition)
        yPosition = 547
        CopyLigjtLabel.layer.position = CGPoint(x: xPosition, y: yPosition)
 
        /* コピーライト文言 */
        CopyLigjtLabel.text = "\(COPYLIGHT_C) \(currentYear()) \(AUTOR_NAME) \(ALLRIGHTRESERVED)"
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 設定イメージボタンクリック */
    @IBAction func ConfigImageButtonTouchDown(sender: AnyObject) {
        //ConfigTopViewController 画面に遷移(ページをめくるような遷移)
        segueButtonTouchDown(ConfigTopViewController(), modalTransitionStyle: UIMODALTRANSITIONSTYLE_PARTIALCURL)
    }
    
    /* Wantボタンクリック */
    @IBAction func WantButtonTouchDown(sender: AnyObject) {
        //WantTopViewController 画面に遷移(ページをめくるような遷移)
        segueButtonTouchDown(WantTopViewController(), modalTransitionStyle: UIMODALTRANSITIONSTYLE_PARTIALCURL)
    }
    
    /* Getボタンクリック */
    @IBAction func GetButtonTouchDown(sender: AnyObject) {
        //GetTopViewController 画面に遷移（ページをめくるような遷移）
        segueButtonTouchDown(GetTopViewController(), modalTransitionStyle: UIMODALTRANSITIONSTYLE_PARTIALCURL)
    }
    
    /* Giveボタンクリック */
    @IBAction func GiveButtonTouchDown(sender: AnyObject) {
        //GiveTopViewController 画面に遷移（ページをめくるような遷移）
        segueButtonTouchDown(GiveTopViewController(), modalTransitionStyle: UIMODALTRANSITIONSTYLE_PARTIALCURL)
    }

    /* Searchボタンクリック */
    @IBAction func SearchButtonTouchDown(sender: AnyObject) {
        //SearchTopViewController 画面に遷移（ページをめくるような遷移）
        segueButtonTouchDown(SearchTopViewController(), modalTransitionStyle: UIMODALTRANSITIONSTYLE_PARTIALCURL)
    }
    
    //ボタンクリック時の画面遷移
    func segueButtonTouchDown(targetViewController: UIViewController, modalTransitionStyle: UIModalTransitionStyle){

        //ボタンクリック時に遷移する先の画面のインスタンスをルートビューコントローラに設定
        let navigationController = UINavigationController(rootViewController: targetViewController)
        
        //遷移時のアニメーション効果
        navigationController.modalTransitionStyle = modalTransitionStyle
        
        //画面遷移
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    //コピーライトの年の文字列生成
    func currentYear() -> String{
        
        let nowDate = NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = YEAR_STRING_FORMAT
        
        //現在日時の年を取得する
        let nowYear: String = formatter.stringFromDate(nowDate)
        
        //関数の戻り値
        var returnValue: String = ""
        
        //年の判定
        if (nowYear == IMPLIMENTAL_YEAR){
            //実装開始年が２０１６年なのでコピーライトの文字列は「２０１６」
            returnValue = IMPLIMENTAL_YEAR
        }else{
            //2017年からは２０１６年から継続している文言とする
            returnValue = "\(IMPLIMENTAL_YEAR)-\(nowYear)"
        }
        //戻り値を返す
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

//
//  ViewController.swift
//  FinalAssessment3_Post
//
//  Created by Chiu Chih-Che on 2016/11/11.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var urlString: String = "https://httpbin.org/get"
        Alamofire.request(.GET, urlString, parameters: nil).responseJSON(){
                response in
                if let jsonData = response.result.value {
                    //print("response : \(jsonData)")
                    let json = JSON(jsonData)
                    let originValue = json["origin"].stringValue
                    print("PART1 : origin value = \(originValue)")
                }
        }
        
        var nowObj = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let nowStr = dateFormatter.stringFromDate(nowObj)
        let timestampStart = nowObj.timeIntervalSince1970
        
        urlString = "https://httpbin.org/post"
        Alamofire.request(.POST, urlString, parameters: [
            "time" : nowStr
            ]).responseJSON(){
            response in
            if let _ = response.result.value {
                //print("response : \(jsonData)")
                nowObj = NSDate()
                let timestampEnd = nowObj.timeIntervalSince1970
                print("PART2 : 請求回應時間 = \(timestampEnd - timestampStart) 秒")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


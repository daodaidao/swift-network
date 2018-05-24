//
//  SJY01Service.swift
//  HDGGServiceDemo
//
//  Created by caihongguang on 2018/5/24.
//  Copyright © 2018年 SYJ. All rights reserved.
//


let HDHM01_URL = "http://api.hoto.cn/index.php" + "?appid=4&appkey=573bbd2fbd1a6bac082ff4727d952ba3&format=json&sessionid=1404277925&vc=25&vn=v3.5.2&loguid=&deviceid=0f607264fc6318a92b9e13c65db7cd3c%7CFFDD5AB8-D715-4007-9E15-DF103EB9DD01%7C825300FA-E7F0-4E82-9181-E914E3EBEEA0&channel=appstore&uuid=8332A3FB-D4DF-416D-AA3D-443277ECAD26&method=Suggest.recipeV3"


import Foundation
import ObjectMapper

//网络请求和数据缓存类
class SJY01Service {
    

/** 逛逛主页数据
     
     parameter successBlock 成功
     parameter failBlock 失败
     
 **/

//@escaping标明这个闭包是会“逃逸”,通俗点说就是这个闭包在函数执行完成之后才被调用。
    func doGetRequest_HDHM01_URL(_ successBlock:@escaping (_ hdResponse: HDHM01Response) ->Void, failBlock:@escaping (_ error:NSError) -> Void){
        
        HDRequestManager.doGetRequest(HDHM01_URL) { (response) in
            
            if response.result.error == nil {
                
                // JSON 转换成对象。。 重点句子
                let hdHM01Response = Mapper<HDHM01Response>().map(JSONObject: response.result.value)
                
//                print("hdHM01Response:\(hdHM01Response)")

                successBlock(hdHM01Response!)

            }
            else {
                
                failBlock(response.result.error! as NSError)

            }

        }
    
    
    }


}








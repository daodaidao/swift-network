//
//  HDRequestManager.swift
//  HDGGServiceDemo
//
//  Created by caihongguang on 2018/5/24.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import Foundation

import Alamofire

// get  和 post 处理类
class HDRequestManager: NSObject {
    
    static func doGetRequest(_ URL: String, completeBlock: @escaping (_ response: DataResponse<Any>) -> Void)
    {
        
        print("PostURL \(URL as AnyObject)")
        
        Alamofire.request(URL).responseJSON { response in
            
            if response.result.error == nil {
                
                //请求成功
                let text: String = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)! as String
                
                print("Data\(text as AnyObject)")

            }
            else {
                //请求出错了
                print("error\((response.result.error)! as AnyObject)")

            }
            
            completeBlock(response)
            
        }
        
        
    }
    

}

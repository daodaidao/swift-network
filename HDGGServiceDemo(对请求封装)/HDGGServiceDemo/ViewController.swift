//
//  ViewController.swift
//  HDGGServiceDemo
//
//  Created by caihongguang on 2018/5/24.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    
    /**
     
     *  数据请求结果集
     */
    var hdHM01Response: HDHM01Response?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        doGetRequestData()
        
    }
    
    func doGetRequestData(){
        
        unowned let WS = self
        
        SJY01Service().doGetRequest_HDHM01_URL({ (hdResponse) ->Void in
            
            // 直接获取到结果集， 数据请求结果集
            WS.hdHM01Response = hdResponse
            
            print("WS.hdHM01Response?.result?.tagList: \(WS.hdHM01Response?.result?.tagList)")
            
            
            
            
        }) { (error)  -> Void in
            
            
            
        }
        
        
        
        
    }
    
    
}


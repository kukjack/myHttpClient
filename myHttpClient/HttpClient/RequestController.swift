//
//  RequestController.swift
//  HttpClientDemo
//
//  Created by 邓龙 on 15/5/15.
//  Copyright (c) 2015年 www.beequick.cn. All rights reserved.
//

import UIKit

class RequestController: UIViewController, ToolProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func requestGetData(url:NSString) {
        var dl = HttpClient()
        dl.delegate = self
        dl.getDataDic(url)
    }
    
    func requestPostData(url:NSString, dic:NSDictionary) {
        var dl=HttpClient()
        dl.delegate = self
        dl.postDataDic(url, dic: dic)
    }

    func didResponse(dict: NSDictionary) {
        var response = ResponseController.sharedManager()
        response.getResponseList(dict)
    }
}

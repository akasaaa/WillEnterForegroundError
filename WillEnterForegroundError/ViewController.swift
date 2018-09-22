//
//  ViewController.swift
//  WillEnterForegroundError
//
//  Created by 赤迫亮太 on 2018/09/22.
//  Copyright © 2018年 akasaaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(connection),
                                               name: UIApplication.willEnterForegroundNotification, // .didBecomeActiveNotificationにすると失敗しなくなる。
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func connection() {
        let url = URL(string: "https://qiita.com/ichimots")!
        URLSession.shared.dataTask(with: url) { _, response, error in
            if let _ = response {
                print("---success---")
            }
            if let error = error {
                print("---fail---")
                print(error) // Error Domain=NSPOSIXErrorDomain Code=53 "Software caused connection abort" UserInfo={_kCFStreamErrorCodeKey=53, _kCFStreamErrorDomainKey=1}
            }
        }.resume()
    }
}

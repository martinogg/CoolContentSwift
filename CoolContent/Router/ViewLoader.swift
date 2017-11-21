//
//  ViewLoader.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ViewLoaderProtocol : class {
    func getView(withDict dict: Dictionary<String, Any>, callback: ((_ vc: UIViewController) -> Void))
}

class ViewLoader: ViewLoaderProtocol {
    private let router: RouterProtocol;
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func getView(withDict dict: Dictionary<String, Any>, callback: ((_ vc: UIViewController) -> Void)) {
        
        callback(router.getContentViewController(viewLoader: self, config: dict))
    }
    
    static let currentVersion = 3 // V3
    
    static public func getDictFromFile(name: String) -> Dictionary<String, Any>? {
        
        var ret: Dictionary<String, Any>? = nil
        
        do {
            if let file = Bundle.main.url(forResource: name, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let object = json as? [String: Any],
                    let configVer = object["targetVersion"] as? Int,
                    let content = object["content"] as? [String: Any]
                {
                    // dictionary
                    if (configVer <= currentVersion ) {
                        ret = content
                    } else {
                        print("App loader ver too old")
                    }
                    
                } else {
                    print("JSON invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return ret
    }

}

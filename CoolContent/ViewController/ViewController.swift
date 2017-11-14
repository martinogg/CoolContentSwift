//
//  ViewController.swift
//  CoolContent
//
//  Created by martin ogg on 13/11/2017.
//  Copyright © 2017 martinogg. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate : class {
    func push(view viewController: UIViewController)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let startButton = UIButton.init(type: .roundedRect)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 10, y: 120, width: 130, height: 30)
        
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside);
        self.view.addSubview(startButton)
    }
    
    lazy private var viewModel: ViewModelProtocol = {
        [unowned self] in
        return ViewModel.init(self, ViewLoader.init(router: Router.init()))
    }()
    
    @objc func startButtonPressed() {
        self.viewModel.startButtonPressed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func push(view viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}


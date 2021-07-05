//
//  ViewController.swift
//  Remind
//
//  Created by Fang on 2021/4/17.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "提醒列表"
        
        createUI()
        bindSignal()
    }

    private func createUI() {
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func bindSignal() {
        _ = addButton.rx.tap.subscribe { [weak self](event) in
            print("按钮被点击   \(event)")
            let add = AddViewController()
            self?.navigationController?.pushViewController(add, animated: true)
        }
    }
    
    //MARK: lazy
    lazy var addButton: UIBarButtonItem = {
        let item = UIBarButtonItem(systemItem: .add)
        
        return item
    }()
    

}


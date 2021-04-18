//
//  AddViewController.swift
//  Remind
//
//  Created by Fang on 2021/4/17.
//

import UIKit
import MapKit
import SnapKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "添加任务"
        
        createUI()
        bindSignal()
    }
    
    private func createUI() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    private func bindSignal () {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: lazy
    lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }()
}

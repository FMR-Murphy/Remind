//
//  AddViewController.swift
//  Remind
//
//  Created by Fang on 2021/4/17.
//

import UIKit
import SnapKit
import MapKit
import WidgetKit

class AddViewController: UIViewController {
    
    let viewModel = TaskViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "添加任务"
        
        createUI()
        bindSignal()
        startLocation()
    }
    
    private func createUI() {
        view.backgroundColor = .white
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(400)
        }
    }
    
    private func bindSignal () {
        
    }
    
    func startLocation() {
        
        viewModel.startLocation { [weak self] (coordinate) in
            if coordinate != nil {
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate!, span: span)
                self?.mapView.setRegion(region, animated: true)
            }
        }
//        WidgetCenter.shared.getCurrentConfigurations { (result) in
//            print(result)
//        }
        WidgetCenter.shared.reloadAllTimelines()
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

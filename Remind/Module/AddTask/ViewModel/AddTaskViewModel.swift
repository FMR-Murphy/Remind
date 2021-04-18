//
//  AddTaskViewModel.swift
//  Remind
//
//  Created by Fang on 2021/4/18.
//

import Foundation
import CoreLocation
import UIKit

class TaskViewModel: NSObject, CLLocationManagerDelegate {
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        //更新范围
//        manager.distanceFilter = 10
        //精度
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
    }()
    
    var locationCallBack: ((CLLocationCoordinate2D?)->())? = nil
    func startLocation(callBack:@escaping (CLLocationCoordinate2D?) ->()) {
        locationWhenAllow()
        locationCallBack = callBack
    }
    
    func locationWhenAllow() {
        
        let status = CLLocationManager().authorizationStatus
        
        switch status {
        case .notDetermined:
            //未决定
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            //受限制，无法改变状态，可能是家长控制
            break
        case .denied:
            //禁止权限或定位功能未开启
            goApplicationSetting()
            break
        case .authorizedAlways:
            //一直允许
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            //App使用时允许
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            fatalError()
        }
    }
    
    
    
    private func goApplicationSetting() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey : Any](), completionHandler: nil)
        }
    }
    
    //MARK:LocationManagerDelegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationCallBack != nil {
            locationCallBack!(locations.first?.coordinate)
            manager.stopUpdatingLocation()
        }
    }
}

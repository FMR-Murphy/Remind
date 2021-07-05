//
//  RMapView.swift
//  Remind
//
//  Created by Fang on 2021/4/18.
//

import SwiftUI
import MapKit

struct RMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.0, longitude: 116.0), span: span)
//        uiView.setRegion(region, animated: true)
        
    }

}

struct RMapView_Previews: PreviewProvider {
    static var previews: some View {
        RMapView()
    }
}


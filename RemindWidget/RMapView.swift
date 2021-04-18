//
//  RMapView.swift
//  Remind
//
//  Created by Fang on 2021/4/18.
//

import Foundation
import SwiftUI
import MapKit

struct RMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //        let coordinate = CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
        //        let region = MKCoordinateRegion(center: coor, span: <#T##MKCoordinateSpan#>)
        //        view.setRegion(MKCoordinateRegion, animated: <#T##Bool#>)

    }
    
    
}

struct RMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        RMapView()
            .previewDevice("iPhone 12")
    }
}

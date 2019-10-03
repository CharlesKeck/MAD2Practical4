//
//  LocationDelegate.swift
//  Telegramme
//
//  Created by Charles on 3/10/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import CoreLocation

class LocationDelegate : NSObject, CLLocationManagerDelegate
{
    var locationCallback: ((CLLocation) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        guard let currentLocation = locations.last else { return }
        locationCallback?(currentLocation)
    }
}


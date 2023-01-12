//
//  MapViewController.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 07/01/2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTX: UITextField!
    // MARK: - Make Vars
    //
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        
        if isLocationServiceEnabel() {
            checkAuthorization()
        } else {
            showAlert(message: "Please Enabel Location to continue")
        }
        
    }
    // MARK: - to check if location enabel
    //
    func isLocationServiceEnabel () -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    // MARK: - to check if user allow to access location
    //
    func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlert(message: "Please authorize accessto location")
            break
        case .restricted:
            showAlert(message: "Authorization Restricted")
            break
        default :
            print("default")
            break
            
        }
    }
    // MARK: - to check if user change your location
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("location\(location.coordinate)")
            zoomToUserLocation(location: location)
            locationManager.stopUpdatingLocation()
        }
    }
    // MARK: -  to check if user change your access
    //
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlert(message: "Please authorize accessto location")
            break
        default :
            print("default")
            break
        }
    }
    // MARK: - to zoom to user location in map
    //
    func zoomToUserLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    // MARK: -  to show alert if user no enabel location
    //
    func showAlert (message: String) {
        let alertController = UIAlertController(title: "ALERT", message: message,preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Close", style: .default)
        let cancelAction = UIAlertAction(title: "Settings", style: .default) { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        guard let destination = locationTX.text else {return}
        if destination != " " {
            serchForDestination(destination: destination)
        } else {
            showAlert(message: "Please Enter Your Destination")
        }
    }
    func serchForDestination(destination: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(destination) { places, error in
            guard let place = places?.first, error == nil else {
                self.showAlert(message: "No , Data To Display")
                return
            }
            print("places details")
            print(place.name)
            guard let location = place.location else {return}
            self.locationTX.text = " "
            
            let pin = MKPointAnnotation()
            pin.title = "\(place.name)"
            pin.subtitle = " \(place.country)"
            pin.coordinate = location.coordinate
            self.mapView.addAnnotation(pin)
            
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            self.mapView.setRegion(region, animated: true)
            
        }
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //        let latitude: Double = 24.693719
    //        let longitude: Double = 46.723596
    //        // Do any additional setup after loading the view.
    //        let initalLoc = CLLocation(latitude: 24.693719, longitude: 46.723596) // to set inial location
    //        setStartingLoctaion(location: initalLoc, distance: 1000)
    //        addAnntation(latitude: latitude, longitude: longitude)
//}

//    func setStartingLoctaion(location: CLLocation, distance: CLLocationDistance) {
//
//        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
//        mapView.setRegion(region, animated: true) // to zoom in location center
//        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true) // to determinate the place work
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 250000) // to determinate the place work
//        mapView.setCameraZoomRange(zoomRange, animated: true)
//
//    }
//    // location information
//    func addAnntation(latitude: Double,longitude: Double) {
//        let pin = MKPointAnnotation()
//        pin.title = "Your_Location"
//        pin.subtitle = " location"
//        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: latitude)
//        mapView.addAnnotation(pin)
//
//    }


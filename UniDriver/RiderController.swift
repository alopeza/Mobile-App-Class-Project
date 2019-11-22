//
//  RiderController.swift
//  UniDriver
//


import UIKit
import GoogleMaps

class RiderController: UIViewController {
    
    

    private let LocationManager = CLLocationManager()

    var controller = UniDataController()
    var signedInUser: UniUser?
    
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var dropOffLocation: UITextField!

    @IBOutlet weak var RiderMapView: GMSMapView!
    override func viewDidLoad() {
        LocationManager.delegate = self as? CLLocationManagerDelegate
        LocationManager.requestWhenInUseAuthorization()
        super.viewDidLoad()
    }

    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func FindDriver(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
   
}

// MARK: - CLLocationManagerDelegate
//1
extension RiderController: CLLocationManagerDelegate {
  // 2
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    // 3
    guard status == .authorizedWhenInUse else {
      return
    }
    // 4
    LocationManager.startUpdatingLocation()

    //5
    RiderMapView.isMyLocationEnabled = true
    RiderMapView.settings.myLocationButton = true
  }

  // 6
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    // 7
    RiderMapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
    print(location.coordinate)
    // 8
    LocationManager.stopUpdatingLocation()
  }
}

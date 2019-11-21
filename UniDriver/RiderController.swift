//
//  RiderController.swift
//  UniDriver
//


import UIKit
import GoogleMaps

class RiderController: UIViewController {

private let LocationManager = CLLocationManager()
    
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var dropOffLocation: UITextField!
    
    @IBOutlet weak var RiderController: GMSMapView!
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
    RiderController.isMyLocationEnabled = true
    RiderController.settings.myLocationButton = true
  }
  
  // 6
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
      
    // 7
    RiderController.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
      
    // 8
    LocationManager.stopUpdatingLocation()
  }
}

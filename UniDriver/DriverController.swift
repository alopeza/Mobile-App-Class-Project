//
//  DriverController.swift
//  UniDriver
//

import UIKit
import GoogleMaps

class DriverController: UIViewController {

    private let LocationManager = CLLocationManager()
    
    @IBOutlet weak var clockInButton: UIButton!
    @IBOutlet weak var clockOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationManager.delegate = self as? CLLocationManagerDelegate
        LocationManager.requestWhenInUseAuthorization()
        
        clockOutButton.isHidden = true;
        clockOutButton.isEnabled = false;
    }
    
    @IBOutlet weak var DriverMapView: GMSMapView!
    
    @IBAction func ClockIn(_ sender: Any) {
        clockInButton.isEnabled = false
        clockInButton.isHidden = true
        clockOutButton.isEnabled = true
        clockOutButton.isHidden = false
    }
    
    @IBAction func ClockOut(_ sender: Any) {
        clockInButton.isEnabled = true
        clockInButton.isHidden = false
        clockOutButton.isEnabled = false
        clockOutButton.isHidden = true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

   
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

}
// MARK: - CLLocationManagerDelegate
//1
extension DriverController: CLLocationManagerDelegate {
  // 2
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    // 3
    guard status == .authorizedWhenInUse else {
      return
    }
    // 4
    LocationManager.startUpdatingLocation()
      
    //5
    DriverMapView.isMyLocationEnabled = true
    DriverMapView.settings.myLocationButton = true
  }
  
  // 6
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
      
    // 7
    DriverMapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
    
    
    // 8
    LocationManager.stopUpdatingLocation()
  }
}

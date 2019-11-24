//
//  RiderController.swift
//  UniDriver
//


import UIKit
import GoogleMaps

class RiderController: UIViewController, UITextFieldDelegate {
    
    

    private let LocationManager = CLLocationManager()

    var controller = UniDataController()
    var signedInUser: UniUser?
    
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var dropOffLocation: UITextField!
    
    
    @IBOutlet weak var RiderMapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.delegate = self as? CLLocationManagerDelegate
        LocationManager.requestWhenInUseAuthorization()
        pickUpLocation.delegate = self
        dropOffLocation.delegate = self
        
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func Route(_ sender: Any) {
        self.performSegue(withIdentifier: "findDriver", sender: self)
    }
    
    @IBAction func AccountInfo(_ sender: Any) {
        self.performSegue(withIdentifier: "RiderAccount", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RiderAccount" {
            let destinationVC = segue.destination as! RiderAccountController
            destinationVC.controller = controller
            destinationVC.signedInUser = signedInUser
        }
        else if segue.identifier == "findDriver" {
            let destinationVC = segue.destination as! FindDriverController
            destinationVC.controller = controller
            destinationVC.signedInUser = signedInUser
        }
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

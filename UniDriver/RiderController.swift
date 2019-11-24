//
//  RiderController.swift
//  UniDriver
//


import UIKit
import GoogleMaps

class RiderController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - Variables and Outlets
    private let LocationManager = CLLocationManager()
    var controller = UniDataController()
    var signedInUser: UniUser?
    
    @IBOutlet weak var routeButton: UIButton!
    @IBOutlet weak var findDriverButton: UIButton!
    
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var dropOffLocation: UITextField!
    @IBOutlet weak var RiderMapView: GMSMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.delegate = self
        LocationManager.requestWhenInUseAuthorization()
        pickUpLocation.delegate = self
        dropOffLocation.delegate = self
        
        findDriverButton.isEnabled = false
        findDriverButton.isHidden = true
        
    }
    
    
    // MARK: - KeyBoard
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    // MARK: - Navigation
    
    @IBAction func back(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func Route(_ sender: Any) {
        routeButton.isHidden = true
        routeButton.isEnabled = false
        findDriverButton.isEnabled = true
        findDriverButton.isHidden = false
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
        
    }
    
    // MARK: - Model
       
   func NoDrivers(){
       self.performSegue(withIdentifier: "NoDriver", sender: self)
   }
   
    
    @IBAction func findDrivers(_ sender: Any) {
        
           controller.getDriveList(){
               list in
               
               for driver in list {
                   if driver?.isLoggedIn == false {
                       print("Found Driver")
                       
                   }
               }
           }
    
           print("Find Drivers")
           NoDrivers()
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

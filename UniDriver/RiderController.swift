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
    var signedRiderUser: UniUser?
    var driverUser: UniUser?
    
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
            destinationVC.signedRiderUser = signedRiderUser
        } else if segue.identifier == "DriverFound"{
            let destinationVC = segue.destination as! DriverFoundController
            destinationVC.controller = controller
            destinationVC.driverUser = driverUser
        }
        
    }
    
    // MARK: - Model

    func FoundDrivers(){
        self.performSegue(withIdentifier: "DriverFound", sender: self)
    }
   func NoDrivers(){
       self.performSegue(withIdentifier: "NoDriver", sender: self)
   }
   
    
    @IBAction func findDrivers(_ sender: Any) {
        
        var foundDriver = false
           controller.getDriveList(){
               list in
               
               for driver in list {
                if driver?.isLoggedIn == true {
                        self.driverUser = driver
                        foundDriver = true
                        break
                   }
               }
            if (!foundDriver) {
        
                self.NoDrivers()
            } else {
                self.FoundDrivers()
                
                
            }
            
           }
        
        controller.getDriveList(){
        list in
        
        for driver in list {
            print(String(driver!.name))
            
            }
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

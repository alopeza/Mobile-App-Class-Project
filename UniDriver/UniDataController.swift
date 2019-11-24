//
//  UniDataController.swift
//  UniDriver
//
//  Created by user155127 on 11/19/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation
import Firebase

class UniDataController{
    var userDB: DatabaseReference
    var tripDB: DatabaseReference
    
    init(){
        userDB = Database.database().reference(withPath: "uni-user")
        tripDB = Database.database().reference(withPath: "uni-trips")
    }
    
    func Save(user: UniUser){

        
        let userRef = self.userDB.child(user.username)
        userRef.setValue(user.toAnyObject())
        /*
        {
            (error: Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data was not saved: \(error)")
            } else {
                print("Saved successfully")
            }
        }
        */
        
        guard let trips = user.previousTrips else {return}
        let tripRef = self.tripDB.child(user.username)

        for trip in trips {
            tripRef.setValue(trip.toAnyObject())
        }
    }
    
    func testSave() {
        //let newUser = UniUser(username: "cookr04", name: "Robert Cook", email: "robert.cook@okstate.edu", userType: .Driver)
        let newUser = UniUser(username: "cookrrider02", password: "password", name: "Robert Cook", email: "robert.cook@okstate.edu", userType: .Rider)
        
        newUser.setCurrentLocation(lat: 2.554, long: 7.867)
        newUser.setVehicle(make: "Honda", model: "Pilot", color: "2012", licensePlate: "frr433")
        newUser.setCCInfo(ccNumber: "4353444434333222", ccExpDate: "10/12/2020", cvv: "908")
        newUser.isLoggedIn = true
        self.Save(user: newUser)
    }
    
    //Mark: Get Methods
    
    func getUser(userName: String, completition: @escaping (UniUser?) -> Void) -> Void {
        var returnUser:UniUser?
        
        self.userDB.queryOrdered(byChild: "username").queryEqual(toValue: userName).observeSingleEvent(of: .value, with: {snapshot in
            returnUser = UniUser(snapshot: snapshot, lookupKey: userName)
            completition(returnUser)
        })
    }
    
    func getDriveList(completition: @escaping ([UniUser?]) -> Void) -> Void {
        var driverList = [UniUser?]()
        
        self.userDB.queryOrdered(byChild: "userType").queryEqual(toValue: "Driver").observe(.value, with: {snapshot in
            let driverDict = snapshot.value as? [String: AnyObject]
            if let driverDict = driverDict {
                for driver in driverDict {
                    let driverValues = driver.value as? [String: AnyObject]
                    let addDriver = UniUser(value: driverValues!, ref: snapshot.ref, key: "")
                    if addDriver!.isLoggedIn{
                        driverList.append(addDriver)
                    }
                }
            }
            
            completition(driverList)
        })
    }
    
    func getDriverActiveTrip(userName: String, completition: @escaping (Trip?) -> Void) -> Void {
        var activeTrip: Trip?
        self.tripDB.queryOrdered(byChild: "driverUserName").queryEqual(toValue: userName).observeSingleEvent(of: .value, with: {snapshot in
            activeTrip = Trip()
            completition(activeTrip)
        })
    }
    
    func getPreviousTripList(user: UniUser, completition: @escaping ([Trip?]) -> Void) -> Void {
        var tripList = [Trip?]()
        let childElement: String
        if user.userType == .Driver {
            childElement = "driverUserName"
        } else {
            childElement = "riderUserName"
        }
        
        self.tripDB.queryOrdered(byChild: childElement).queryEqual(toValue: user.username).observe(.value, with: {snapshot in
            let tripDict = snapshot.value as? [String: AnyObject]
            if let tripDict = tripDict {
                for trip in tripDict {
                    let tripValues = trip.value as? [String: AnyObject]
                    let addTrip = Trip(value: tripValues!, ref: snapshot.ref, key: "")
                    tripList.append(addTrip)
                }
            }
            completition(tripList)
        })
    }
    
    //Mark: Update Methods

    //This overload is only here to prevent breaking changes, as the driverUserName
    //was a new addition. This needs to be depricated
    func startTrip(user: UniUser, start: Location, destination: Location, fare: Double){
        startTrip(user: user, start: start, destination: destination, fare: fare, driverUserName: "")
        
    }
    
    func startTrip(user: UniUser, start: Location, destination: Location, fare: Double, driverUserName: String){
        user.currentTrip = Trip()
        user.currentTrip?.startLocation = start
        user.currentTrip?.destination = destination
        user.currentTrip?.fare = fare
        user.currentTrip?.tripStartDate = Date()
        user.currentTrip?.tripEndDate = Date()
        user.currentTrip?.tripCost = 0.00
        user.currentTrip?.isActive = true
        user.currentTrip?.isComplete = false
        user.currentTrip?.driverUserName = driverUserName
        user.currentTrip?.riderUserName = user.username
        addCurrentTripToHistory(user: user)
    }
    
    func endTrip(user: UniUser) {
        user.currentTrip?.tripEndDate = Date()
        let intervalSeconds = user.currentTrip?.tripEndDate.timeIntervalSince(user.currentTrip!.tripStartDate)
        let seconds = Double(intervalSeconds!)
        let totalCost = (user.currentTrip!.fare) * (seconds / 60 / 60)
        user.currentTrip?.tripCost = totalCost
        user.currentTrip?.isActive = false
        user.currentTrip?.isComplete = true
        
        //addCurrentTripToHistory(user: user)
        
        user.currentTrip = nil
    }
    
    private func addCurrentTripToHistory(user: UniUser){
        let trip = user.currentTrip!
        user.previousTrips = [Trip]()
        user.previousTrips?.append(trip)
    }
}

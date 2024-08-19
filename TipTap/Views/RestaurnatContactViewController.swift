//
//  RestaurnatContactViewController.swift
//  TipTap
//
//  Created by yarramsetti yedukondalu on 10/07/24.
//
import UIKit

class RestaurnatContactViewController: UIViewController {
    var selectedFor: String = ""
    var selected: [Restaurant] = [] // Assuming Restaurant is your data model type
    var selectedRestaurantData = [RestaurantCompleteData]()
    // Connect your outlets as needed
    @IBOutlet weak var restaurantTitleLabel: UILabel!
    @IBOutlet weak var restaurantAddressLabel: UILabel!
    @IBOutlet weak var restaurantPhoneNumberLabel: UILabel!
    //@IBOutlet weak var restaurantLandMarkLabel: UILabel!
    @IBOutlet weak var restaurantZipLabel: UILabel!
    @IBOutlet weak var restaurantCityLabel: UILabel!
    
    @IBOutlet weak var superDesignView: UIView!
    @IBOutlet weak var designView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        designView.layer.cornerRadius = 5
        superDesignView.layer.cornerRadius = 5
        self.superDesignView.cellBackViewShadow()
        // Update UI with selected restaurant data if available
        if let selectedRestaurant = selectedRestaurantData.first {
            restaurantTitleLabel.text = selectedRestaurant.restaurant.RestaurantTitle
            restaurantAddressLabel.text = selectedRestaurant.restaurant.RestaurantAddress
           // restaurantPhoneNumberLabel.text = "\(selectedRestaurant.restaurant.RestaurantPhone)"
            
         //   restaurantLandMarkLabel.text = selectedRestaurant.restaurant.LandMark
            restaurantZipLabel.text = selectedRestaurant.restaurant.ZipCode.map { String($0) } ?? ""
            
            restaurantPhoneNumberLabel.text = selectedRestaurant.restaurant.RestaurantPhone.map { String($0) } ?? ""
 restaurantCityLabel.text = selectedRestaurant.restaurant.RestaurantCity
        }
    }
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

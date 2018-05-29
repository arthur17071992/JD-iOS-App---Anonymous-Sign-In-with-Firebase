//
//  ServiceTableViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit

class ServiceTableViewController: UITableViewController {

    var titleList = [" ", "Artificial Nail", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", " ", "Add ons", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", " ", "Little Misses Mini Polish", "", "", "", " ", "Polish Change", "", "", " ", "Collagen", "", "", "", " ", "Manicure & Pedicure", "", "", "", "", "", "", "", "", "", "", "", " ", "Vegan Manicure & Pedicure", "", "", "", "", "", "", "", "", "", "", "", "", "", " ", "Ultimate Spa Pedicure", "", "", "", "", "", "", "", "", " ", "Waxing", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", " ", "Eyelashes", "", "", "", "", " ", "Skin Care & Massage", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var priceList = ["", "", "FULL    FILL", "$25+    $15+  ", "$35+    $23+  ", "$45+    $25+  ", "$38+", "$35+    $25+  ", "$45+    $25+  ", "$40+", "$45+    $30+  ", "$60+    $50+  ", "Extra $15", "$45+", "$40+", "$10", "$30", "$33", "", "", "$20", "$25", "$8", "$14", "$5", "$5", "$10", "$10 & Up", "$5", "$3", "$5", "$20", "$15", "$20", "$25", "$35", "", "", "", "", "", "", "", "$8/$10", "$10/$12", "", "", "", "$10", "$10", "", "", "MANI    PEDI", "$15       $25  ", "", "$20       $32  ", "", "$25       $35  ", "", "$30       $35  ", "", "$30       $40  ", "", "", "", "", "MANI    PEDI", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "$30       $45  ", "", "", "", "MANI    PEDI", "$35       $50  ", "$35       $50  ", "$35       $50  ", "$35       $50  ", "$35       $50  ", "$20  ", "", "", "$10", "$6", "$10 & Up", "$10", "$20", "$25", "$45", "$30", "$40", "$50 & Up", "$70 & Up", "$35", "$65", "$35 & Up", "$50 & Up", "", "", "$15", "$30", "$50", "$150", "", "", "$50/30'", "", "$65/45'", "", "$75/50'", "", "$85/60'", "", "$70/60'", "", "$80/60'", "", "$85/60'", "", "$85/60'"]
    
    var serviceList = ["", "", "", "Acrylic", "Power Gell", "Solar Nail/Pink & White", "Pink & White Powder Back Fill", "Solar Pink Powder", "Color or Glitter Power", "Color or Glitter Back Fill", "Liquid Gel Full Set", "Liquid Gell Pink & White", "Gel/Shellac Color", "SNS Dipping Powder", "SNS Returns Services", "Takeoff Acrylic/Dipping", "Gel/Shellac Manicure", "French Gel Manicure", "", "", "Gel Color for Hands/Feet", "Gel French for Hands/Feet", "Paraffin Wax Hands/Feet", "Paraffin Wax both Hands & Feet", "Shine Buff Hand/Toes", "French", "Callus Treatment", "Nail Art", "Acrylic Toes", "Cut Down", "Repair", "Exfoliation, Masque & Massage", "10 Minutes Massage", "15 Minutes Massage", "20 Minutes Massage", "35 Minutes Massage", "", "", "                Hands $7 | Feet $7 | Combo $12", "       Simple polish for the little ones 7 years", "             and under. Design is additional.", "", "", "Polish Change Hands/Feet", "French Polish Change Hands/Feet", "", "", "       Enrich with Collagen and Shea Butter.", "Collagen Gloves", "Collagen Socks", "", "", "", "Basic Manicure/Pedicure", "Shape, Cuticle Trim, Massage, Hot Towel, Polish.", "Sugar Scrub Manicure/Pedicure", "Callus Treatment with Sugar Scrub.", "Spa Manicure/Pedicure", "Scrub, Peppermint Mask, Hot Towel.", "Hot Stone", "Callus Treatment, Scrub, Hot Stone Massage.", "Deluxe Manicure/Pedicure", "Callus Treatment, Scrub, Mask, Paraffin.", "", "", "Complimentary herbal neck wrap. Choose your own scent, including callus treatment, sugar scrub, mask, massage with cream, steam towel & polish.", "", "Charcoal Power Detox", "Jasmine Smoothe", "Vitamin Recharge", "Lavender Relieve", "Green Tea Detox", "Lemon Quench", "Mango Delight", "Ocean Refresh", "Cucumber Fresh", "Tangerine Twist", "Olive Sensation", "", "", "Complimentary herbal neck wrap. Choose your own scent, including callus treatment, sugar scrub, mask, hot stone, massage with Shea Butter, steam towel and finish off with polish.", "", "Milk & Honey", "Aloe Aloe", "Renew Seaberry & Kukui", "Deyox Ginger & Green Tea", "Energy Orange & Lemongrass", "Addtional neck & shoulder massage", "", "", "Eyebrow Shaping", "Upper Lip", "Chin Wax", "Sideburns", "Underarm", "Half Arm Wax", "Full Arm Wax", "Bikini", "Extended Bikini", "Partial Brazilian Wax", "Sphinx Wax", "Half Leg Wax", "Full Leg Wax", "Men's Chest Wax", "Men's Back Wax", "", "", "Strip Lashes", "Eyelash Cluster", "Eva Lash", "Eyelash Extension", "", "", "Mini Facial", "Sonic Cleansing, Exfoliate, Masque Mask, Toning & Moisturizing.", "Pure Facial", "Sonic Cleansing, Exfoliate, Masque Mask, Toning & Moisturizing w/ Hand and Arm Massage.", "Aromatheraphy", "Sonic Cleansing, Exfoliate, Masque Mask, Toning & Moisturizing w/ Blending Oil.", "Deep Pore", "Sonic Cleansing, Exfoliate, Extraction, Masque Mask, Toning & Moisturizing.", "Swedish Massage", "Light Relaxing Massage.", "Deep Tissue Massage", "Intense Deep Pressure.", "Aromatherapy Massage", "Deep Tissue w/ Blending Oil.", "Hot Stone Massage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    } // end func viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // end func didReceiveMemoryWarning

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return serviceList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ServiceTableViewCell
        // Configure the cell...
        cell.titleLists.text = titleList[indexPath.row]
        cell.serviceLists.text = serviceList[indexPath.row]
        cell.priceLists.text = priceList[indexPath.row]
        return cell
    }
} // end class ServiceTableViewController

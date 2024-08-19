//
//  TipsViewController.swift
//  TipTap
//
//  Created by yarramsetti yedukondalu on 12/07/24.
//

import UIKit

class TipsViewController: UIViewController {
    var transactionHistory:[Transaction] = []
    @IBOutlet weak var tipTableView: UITableView!
    @IBOutlet weak var dismissButton: UIButton!
    var tipsImage :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tipsImage)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("This will be executed after a 2-second delay")
        }
        tipTableView.delegate = self
        tipTableView.dataSource = self
        if let historyData = UserDefaults.standard.data(forKey: "transactionHistory") {
            do {
                transactionHistory = try JSONDecoder().decode([Transaction].self, from: historyData)
                transactionHistory.reverse() // Reversing the array to show recent data first
                print(transactionHistory)
            } catch {
                print("Error decoding transaction history data: \(error.localizedDescription)")
            }
        }
        tipTableView.reloadData()
    }
    @IBAction func dismissButtonAction(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "TipTapHomeVC")as! TipTapHomeVC
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        controller.transactionHistory = self.transactionHistory
        self.present(controller, animated: true)
    }
}
extension TipsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionHistory.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Hcell = tipTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TipsHistoryTableViewCell
        let data = transactionHistory[indexPath.row]
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MMMM/yyyy"
            let dateString = dateFormatter.string(from: data.date)
        Hcell.amount?.text = dateString
        Hcell.name?.text = data.transDesc
        Hcell.date.text = " SAR:\(data.amount)"
      //  Hcell.profileImage.image = UIImage(named: "ic_covid_border_waypoint_alert_32pt@3x.png")
        return Hcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


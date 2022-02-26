//
//  SettingsViewController.swift
//  hw10.tables+collections
//
//  Created by gleba on 18.12.2021.
//

import UIKit
struct builder{
    var sec : Bool
    var buttonKeyArray = ["String"]
    var labelArray = ["String"]
}
class dataBuilder{
    static func build() -> [builder]{
        return[
            builder(sec: true, buttonKeyArray: ["wifi","camera"], labelArray: ["wi-fi","camera settings"]),
            builder(sec: false, buttonKeyArray: ["wifi","camera","camera","camera"], labelArray: ["wi-fi","camera settings","wi-fi","camera settings"])
         
        ]
    }
}
class SettingsViewController: UIViewController {
    var data = dataBuilder.build()


    @IBOutlet weak var settingsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension SettingsViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(data[section].labelArray.count)
        return data[section].labelArray.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! TableViewCell
        if data[section].sec == false {
            cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! TableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "stHeader") as! TableViewCell
        }
        return cell
    }
   
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SettingsTableViewCell
        let icon = data[indexPath.section].buttonKeyArray[indexPath.row]
        let name = data[indexPath.section].labelArray[indexPath.row]
        cell.iconImage.image = UIImage(systemName: icon)
        cell.iconNameLabel.text = name
        return cell
    }
    
    
}

//
//  AddMenuViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-18.
//

import UIKit

class AddMenuViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    
    var stringArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "T25 Group"

        
    }
    

    @IBAction func onClickAddButton(_ sender: Any) {
      
        if let txt = txtInput.text, !txt.isEmpty {
                   self.stringArr.insert(txt, at: 0)
                   tableView.beginUpdates()
                   tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
                   tableView.endUpdates()
                   
                   txtInput.text = nil
               }
    }
    
    
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: tableView)
              guard let indexpath = tableView.indexPathForRow(at: point) else {return}
              stringArr.remove(at: indexpath.row)
              tableView.beginUpdates()
              tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
              tableView.endUpdates()
          }
    }
    

extension AddMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
        cell.lblName.text = stringArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

//
//  NextViewController.swift
//  ToDoList
//
//  Created by 濱田莉亜 on 2019/02/22.
//

import UIKit

class NextViewController: UIViewController {
    //日付入力
    @IBOutlet weak var DateText: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        DateText.inputView = datePicker
        
        //
        let wit: Double
        wit = Double(view.frame.size.width)
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: wit, height: 35.0))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ChangeDate)
            
        toolbar.setItems([spaceItem, DoneButton], animated: true)
        
        //
        DateText.inputView = datePicker
        DateText.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }
    //
    @objc func done(){
        DateText.endEditing(true)
        
        //
    }
    //
    @IBAction func ChangeDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月yy日"
        DateText.text = formatter.string(from: sender.date)
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

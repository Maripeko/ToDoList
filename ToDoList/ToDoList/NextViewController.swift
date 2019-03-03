//
//  NextViewController.swift
//  ToDoList
//
//  Created by 濱田莉亜 on 2019/02/22.
//

import UIKit

class NextViewController: UIViewController, UIPickerViewDataSource,  UIPickerViewDelegate {
    
    
    
 
    //カテゴリー入力
    @IBOutlet weak var CategoryText: UITextField!
    //日付入力
    @IBOutlet weak var DateText: UITextField!
    
    let list: [String] = ["個人","仕事","買い物","その他"]
    
    var datePicker: UIDatePicker = UIDatePicker()
    var PickerView: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //カテゴリーピッカー設定
        //categoryPicker.delegate = self as? UIPickerViewDelegate
        //categoryPicker.dataSource = self as? UIPickerViewDataSource
        PickerView.showsSelectionIndicator = true
 
        
        //日付ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        DateText.inputView = datePicker
        
        //決定バーの生成
        let wit: Double
        wit = Double(view.frame.size.width)
        let Dtoolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: wit, height: 35.0))
        let Ctoolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: wit, height: 35.0))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let CdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(Cdone))
        let DdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(Ddone))
        Dtoolbar.setItems([spaceItem, DdoneButton], animated: true)
        Ctoolbar.setItems([spaceItem, CdoneButton], animated: true)
        
        //インプットビュー設定
        DateText.inputView = datePicker
        DateText.inputAccessoryView = Dtoolbar
        
        CategoryText.inputView = PickerView
        CategoryText.inputAccessoryView = Ctoolbar
        
        PickerView.delegate = self
        PickerView.selectRow(0, inComponent: 0, animated: true)
    
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    private func PickerView(_ pickerView: UIPickerView, titleForRow row: Int, forConponent component: Int) -> String? {
        return list[row]
    }
 
    func pickerView(_ categoryPicker: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let label = UILabel()
        label.text = list[row]
        label.textAlignment = NSTextAlignment.center
        return label
    }
    
    //決定ボタン
    @objc func Cdone(){
        CategoryText.text = list[PickerView.selectedRow(inComponent: 0)]
        CategoryText.endEditing(true)
    }
    
    
    
   //
    
    @objc func Ddone(){
        //日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        DateText.text = "\(formatter.string(from: datePicker.date))"
        DateText.endEditing(true)
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

//extension NextViewController : UIPickerViewDelegate{
    

 
//}

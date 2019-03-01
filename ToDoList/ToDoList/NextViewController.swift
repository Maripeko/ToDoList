//
//  NextViewController.swift
//  ToDoList
//
//  Created by 濱田莉亜 on 2019/02/22.
//

import UIKit

class NextViewController: UIViewController {
 
    //カテゴリー入力
    @IBOutlet weak var CategoryText: UITextField!
    //日付入力
    @IBOutlet weak var DateText: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    var categoryPicker: UIPickerView = UIPickerView()
    let list: [String] = ["個人","仕事","買い物","その他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カテゴリーピッカー設定
        categoryPicker.delegate = self as? UIPickerViewDelegate
        categoryPicker.dataSource = self as? UIPickerViewDataSource
        categoryPicker.showsSelectionIndicator = true
 
        
        //日付ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        DateText.inputView = datePicker
        
        //決定バーの生成
        let wit: Double
        wit = Double(view.frame.size.width)
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: wit, height: 35.0))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spaceItem, doneButton], animated: true)
        
        //インプットビュー設定
        DateText.inputView = datePicker
        DateText.inputAccessoryView = toolbar
        
        CategoryText.inputView = categoryPicker
        CategoryText.inputAccessoryView = toolbar
        
        
    
    
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //決定ボタン
    @objc func done(){
        
        //日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日"
        DateText.text = "\(formatter.string(from: datePicker.date))"
        
        CategoryText.text = "\(list[categoryPicker.selectedRow(inComponent: 0)])"
        
        
        
        DateText.endEditing(true)
        CategoryText.endEditing(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}

//extension NextViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    //
  /*  func numberOfComponents(in categoryPicker: UIPickerView) -> Int {
        return 1
    }
 */
    
    //
    
  /*  func categoryPicker(_ categoryPicker: UIPickerView, titleForRom row: Int, forcomponent conponent: Int) -> Int {
      
        return list.count
    }
    
    func categoryPicker(_ categoryPocker: UIPickerView, titleForRow row: Int, forConponent: Int) -> String? {
        
        
        return list[row]
    }
    
    func categoryPicker(_ categoryPicker: UIPickerView, sisSelectionRow row: Int, inComponent component: Int){
        CategoryText.text = list[row]
    }*/
 
}

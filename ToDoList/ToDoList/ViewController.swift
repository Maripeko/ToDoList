//
//  ViewController.swift
//  ToDoList
//
//  Created by 濱田莉亜 on 2019/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var addText:[String] = []
    
    @IBOutlet weak var Cell: UITableViewCell!
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var Date: UILabel!
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addName.count
    }
    
    //セルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = addName[indexPath.row]
        TodoCell.detailTextLabel!.text = addDate[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }

    let sortedStrArray = addDate.sort { $1 > $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


//
//  ViewController.swift
//  SampleTableView
//
//  Created by Kamaraj on 26/03/18.
//  Copyright © 2018 sabari. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var levelArrayObj :[[String:Any]] = [["LavelName": "Level 1","isSelected":true],["LavelName": "Level 2","isSelected":false],["LavelName": "Level 3","isSelected":false],["LavelName": "Level 4","isSelected":false],["LavelName": "Level 5","isSelected":false]]
    
    var distractorArrayObj :[[String:Any]] = [["DistractorName": "Money","isSelected":false],["DistractorName": "Non-Money","isSelected":false],["DistractorName": "Mixed","isSelected":false]]
    
    var selectionArrayObj: [[String:Any]] = [["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false],["SelectionName": "One Penny Coin","isSelected":false]]
    
    
    var sectionData = ["BASIC LEVELS","DISTRACTOR","TEST OPTION","MORE","PROMT(BLINK)","SELECTION"]
    var tableData :[Level] = []
    var distractorData :[Distrctor] = []
     var selectionData :[Selection] = []
    var isShow : Bool = false
    var isSelectAll : Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataForTable()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataForTable()
    {
        var levelArray : [Level] = []
        for (index,_) in levelArrayObj.enumerated()
        {
            let data = levelArrayObj[index]
            let level = Level()
            level.levelName = data["LavelName"] as! String
            level.isSelected = data["isSelected"] as! Bool
            
            levelArray.append(level)
        }
        
        var distractorArray : [Distrctor] = []
        
        for (index,_) in distractorArrayObj.enumerated()
        {
            let data = distractorArrayObj[index]
            let distractor = Distrctor()
            distractor.distractorName = data["DistractorName"] as! String
            distractor.isSelected = data["isSelected"] as! Bool
            
            distractorArray.append(distractor)
        }
        
         var selectionArray : [Selection] = []
        for (index,_) in selectionArrayObj.enumerated()
        {
            let data = selectionArrayObj[index]
            let selection = Selection()
            selection.selectionName = data["SelectionName"] as! String
            selection.isSelected = data["isSelected"] as! Bool
            
            selectionArray.append(selection)
        }
        
        let score = TestOption()
        score.totalScore = "Test"
        score.detailScore = ""
        
        tableData = levelArray
        distractorData = distractorArray
        selectionData = selectionArray
        //tableData.append(score)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0)
        {
            
            return tableData.count
        }
        else if (section == 1)
        {
            return distractorData.count
        }
        else if(section == 3)
        {
            return selectionData.count
        }
        else
        {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionData[section]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "customTableCell") as! CustomHeaderTableViewCell
        headerCell.sectioName.text = sectionData[section]
        if(section == 3)
        {
            headerCell.selectBut.isHidden = false
        }
        else
        {
            headerCell.selectBut.isHidden = true
        }
        if(isSelectAll)
        {
          headerCell.selectBut.setTitle("Deselect All", for: .normal)
        }
        else
        {
        headerCell.selectBut.setTitle("Select All", for: .normal)
        }
        headerCell.selectBut.addTarget(self, action: #selector(self.selectedAllButClicked(sender:)), for: .touchUpInside)
        return headerCell
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! LevelTableViewCell
            let data = tableData[indexPath.row]
            cell.levelName.text = data.levelName
            if(data.isSelected)
            {
                cell.accessoryType = .checkmark
            }
            else
            {
                 cell.accessoryType = .none
            }
            
            return cell
        }
        else if(indexPath.section == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! LevelTableViewCell
            let data = distractorData[indexPath.row]
            cell.levelName.text = data.distractorName
            if(data.isSelected)
            {
                cell.accessoryType = .checkmark
            }
            else
            {
                cell.accessoryType = .none
            }
            return cell
        }
        else if(indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! LevelTableViewCell
            let data = selectionData[indexPath.row]
            cell.levelName.text = data.selectionName
            if(data.isSelected)
            {
                cell.accessoryType = .checkmark
            }
            else
            {
                cell.accessoryType = .none
            }
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! ScoreTableViewCell
           // let data = tableData[indexPath.section] as! Score
            cell.switchScore.tag = indexPath.row
            cell.totalScore.text = "Total Scotre: 123"
            if(isShow)
            {
                cell.detailScore.text = "Detail Score: 1020"
            }
            else
            {
                cell.detailScore.text = ""
            }
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0)
        {
            for (index,_) in tableData.enumerated()
            {
               tableData[index].isSelected = false
            }
            tableData[indexPath.row].isSelected = true
            self.tableView.reloadData()
        }
        else if(indexPath.section == 1)
        {
            for (index,_) in distractorData.enumerated()
            {
                distractorData[index].isSelected = false
            }
            distractorData[indexPath.row].isSelected = true
            self.tableView.reloadData()
        }
        else if(indexPath.section == 3)
        {
            
              selectionData[indexPath.row].isSelected = !selectionData[indexPath.row].isSelected
               self.tableView.reloadData()

        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if(indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 3)
        {
            return 45
        }
        if(indexPath.section == 2)
        {
            if(isShow)
            {
              return 90
            }
            else
            {
               return 45
            }
        }
        else
        {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    @IBAction func `switch`(_ sender: UISwitch) {
        if(sender.isOn)
        {
            isShow = true
        }
        else
        {
            isShow = false
        }
        self.tableView.reloadData()
        
    }
    
  @objc func selectedAllButClicked(sender: UIButton)
  {
    if(!isSelectAll)
    {
        isSelectAll = true
        sender.titleLabel?.text = "Deselect All"
        for (index,_) in selectionData.enumerated()
        {
            selectionData[index].isSelected = true
        }
    }
    else
    {
        isSelectAll = false
        sender.titleLabel?.text = "SelectAll"
        for (index,_) in selectionData.enumerated()
        {
            selectionData[index].isSelected = false
        }
    }
    self.tableView.reloadData()
    }
}


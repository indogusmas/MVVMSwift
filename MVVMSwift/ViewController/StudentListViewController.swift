//
//  StudentListViewController.swift
//  MVVMSwift
//
//  Created by indo gusmas arung samudra on 09/02/19.
//  Copyright © 2019 indo gusmas arung samudra. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editAddres: UITextField!
    
    @IBOutlet weak var tableViewList: UITableView!
    
    let studenVieModel = StudentListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Now first we create add method in view model class
        tableViewSetup()
        // now acces view model first
        
        studenVieModel.reloadStudentList = {[weak self] () in
            self?;tableView?.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonHandlerAddData(_ sender: Any) {
        
        if (editName.text?.count ?? 0 > 0) &&
            (editAddres.text?.count ?? 0 > 0){
            studenVieModel.addStudentData(name: editName.text, addres: editAddres.text)
        }
        
    }
}

extension StudentListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableViewSetup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView1: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studenVieModel.arrayOfStudent?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CellStudentList = tableView.dequeueReusableCell
        (withIdentifier: String(describing:
            CellStudentList.self)) as! CellStudentList
        
        //now we set student data into cell
        //for that we use cell file
        cell.studentObj = studenVieModel.arrayOfStudent?[indexPath.row]
        return cell
    }
    
}


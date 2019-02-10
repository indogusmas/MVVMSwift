//
//  StudentListViewModel.swift
//  MVVMSwift
//
//  Created by indo gusmas arung samudra on 09/02/19.
//  Copyright © 2019 indo gusmas arung samudra. All rights reserved.
//

import Foundation

class StudentListViewModel  {
    //this  viewmodel from StudenListViewController
 
    
    var reloadStudentList = {() -> () in}
    //Create array to save data
    var arrayOfStudent : [Student]? = []{
        didSet{
            reloadStudentList()
            //now implement the table view logic in view controller file
        }
    }
    
    //add method add data
    func addStudentData(name:String?,addres:String?) {
        arrayOfStudent?.append(Student(name: name, addres: addres ?? <#default value#>))
    }
}

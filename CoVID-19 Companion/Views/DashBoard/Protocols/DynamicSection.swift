//
//  DynamicSection.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

protocol DynamicSection: class {
  var rows: [DynamicRow] { get set }
  var title: String? { get set }
  
  func header(tableView: UITableView) -> UITableViewCell?
  
}

extension DynamicSection {
  
  func header(tableView: UITableView) -> UITableViewCell? {
    return nil
  }
  
}

//
//  DynamicRow.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

protocol DynamicRow: class {
    func getCellFor(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func didSelectRow()
}

// empty implementation so that only intrested cells need to worry about this function
extension DynamicRow {
    func didSelectRow() {
        
    }
}

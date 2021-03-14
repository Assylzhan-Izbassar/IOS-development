//
//  SideMenuTableTableViewController.swift
//  KBTUApp
//
//  Created by macbook on 09.03.2021.
//

import UIKit

enum MenuType: Int {
    case home
    case covid
    case news
    case events
    case aboutUs
    case faculties
}

class SideMenuTableViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let menuType = MenuType(rawValue: indexPath.row)
        else { return }
        dismiss(animated: true) { [weak self] in // capture list to avoid retain cycles
            self?.didTapMenuType?(menuType)
//            print("Dissmising: \(menuType)")
        }
    }
}

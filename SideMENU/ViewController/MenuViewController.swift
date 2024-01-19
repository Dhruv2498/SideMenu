//
//  MenuViewController.swift
//  SideMENU
//
//  Created by Mac on 19/12/23.
//

import UIKit
protocol MenuViewControllerDelegate:AnyObject{
    func didselect(menuItem : MenuViewController.menuOption)
    
}
class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    weak var delegate:MenuViewController?
    
    
    enum menuOption:String,CaseIterable{
        case home = "Home"
        case info = "Information"
        case appRating = "Rating App"
        case shareApp = "App Shared"
        case settings = "Settings"
        
        var imageName : String{
            switch self{
                
            case .home:
                return "house"
            case .info:
                return "airplane"
            case .appRating:
                return "star"
            case .shareApp:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
    private let tableView:UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    let greyColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = greyColor
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.size.height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuOption.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: menuOption.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = greyColor
        cell.contentView.backgroundColor = greyColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = menuOption.allCases[indexPath.row]
       // delegate?.didselect(menuItem:item)
        
        
        
    }
}

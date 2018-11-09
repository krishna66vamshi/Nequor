//
//  HomeVC.swift
//  Nequore
//
//  Created by Mahajan on 14/10/18.
//  Copyright © 2018 Mahajan. All rights reserved.
//

import UIKit
import PromiseKit
import NVActivityIndicatorView
class HomeVC: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var homeData: HomeData?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.callApi()
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func callApi() {
        showLoader()
        HomeServices.homes()
            .done { (data) in
                print(data)
                self.homeData = data
                self.tableView.reloadData()
                hideLoader()
            }.catch { (error) in
                hideLoader()
                print(error)
        }
       
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let homeResponse = self.homeData {
            if section == 0 {
            if (homeResponse.preSale?.count)! > 0 {
                return 1
            } else {
                return 0
            }
            } else if section == 1 {
                if (homeResponse.popularProjects?.count)! > 0 {
                    return 1
                } else {
                    return 0
                }
            } else if section == 2 {
                if (homeResponse.featuredLocalities?.count)! > 0 {
                    return 1
                } else {
                    return 0
                }
            }

        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.Table.sales) as? SalesTableViewCell else { return .init() }
            cell.configure(preSales: (self.homeData?.preSale)!)
            return cell
            
        }else if indexPath.section == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.Table.project) as? ProjectsTableViewCell else { return .init() }
            cell.configure(projects: (self.homeData?.popularProjects)!)
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.Table.location) as? LocalitiesTableViewCell else { return .init() }
            cell.configure(localities: (self.homeData?.featuredLocalities)!)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let homeResponse = self.homeData {
            if section == 0 {
                if (homeResponse.preSale?.count)! > 0 {
                    return 50
                } else {
                    return 0
                }
            } else if section == 1 {
                if (homeResponse.popularProjects?.count)! > 0 {
                    return 50
                } else {
                    return 0
                }
            } else if section == 2 {
                if (homeResponse.featuredLocalities?.count)! > 0 {
                    return 50
                } else {
                    return 0
                }
            }
            
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.sectionHeaderHeight = 50
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel(frame: CGRect(x: 20, y: 15, width: self.tableView.frame.size.width-30, height: 20))
        
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor.black
        
        if section == 0{
            label.text = "Pre-Sales"
            view.addSubview(label)
            self.view.addSubview(view)
            return view
            
        }else if section == 1{
            
            label.text = "Popular Projects"
            view.addSubview(label)
            self.view.addSubview(view)
            return view
            
        }else{
            
            label.text = "Featured Localities"
            view.addSubview(label)
            self.view.addSubview(view)
            return view
            
        }
        
    }
    
}


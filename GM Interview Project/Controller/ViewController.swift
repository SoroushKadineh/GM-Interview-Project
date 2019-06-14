//
//  ViewController.swift
//  GM Interview Project
//
//  Created by Soroush Kadineh on 6/13/19.
//  Copyright © 2019 Soroush Kadineh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var commitTableView: UITableView!
    var commitList = [CommitModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
}


// MARK:- handle table view
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView () {
        commitTableView.delegate    = self
        commitTableView.dataSource  = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell_Identifiers.commitCell, for: indexPath)
        guard let particularCommit = commitList[safe: indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.attributedText = particularCommit.prettyString()
        return cell
    }
}


// MARK:- handle data
extension ViewController {
    func fetchData () {
        turnNetworkIndicator(.on)
        DataManager.shared.downloadData { (optionalCommitModelArr) in
            DispatchQueue.main.async { [weak self] in
                guard let strongRef = self else { return }
                strongRef.turnNetworkIndicator(.off)
                guard let commitModelArr = optionalCommitModelArr else { strongRef.displayError(); return }
                strongRef.commitList = commitModelArr
                strongRef.commitTableView.reloadData()
            }
        }
    }
    
    func turnNetworkIndicator (_ state: IndicatorState) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = state.bool
    }
    
    func displayError () {
        let alertController = UIAlertController(title: GenericStrings.error, message: GenericStrings.somethingWentWrong, preferredStyle: .alert)
        let cancelAction    = UIAlertAction(title: GenericStrings.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

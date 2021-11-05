//
//  ViewController.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    let naviBar = CustomNavigationBar()
    
    let mainHeader = HeaderView()
    
    let mainTV = UITableView(frame: .zero, style: .plain)
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAutoLayout()

        mainTV.backgroundColor = .mainBackground
        mainTV.separatorStyle = .none
            
        mainTV.register(TitleTVC.self, forCellReuseIdentifier: "TitleTVC")
        mainTV.register(ActivityTVC.self, forCellReuseIdentifier: "ActivityTVC")
        
        mainTV.delegate = self
        mainTV.dataSource = self
        
        mainTV.tableFooterView = UIView(frame: .zero)
        mainTV.sectionFooterHeight = 0
        
    }
    
    // MARK: - setupAutoLayout
    
    func setupAutoLayout() {
        
        view.addSubviews([mainTV, mainHeader, naviBar])
        
        naviBar.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        mainHeader.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        mainTV.snp.makeConstraints { (make) in
            make.top.equalTo(mainHeader.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 197
        default:
            return 40
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        let width = UIScreen.main.bounds.width
        
        let offset = scrollView.contentOffset.y
        
        if offset > 169 {
            UIView.animate(withDuration: 0.5) {
                self.mainHeader.snp.makeConstraints { (make) in
                    make.height.equalTo(width/2)
                    
                }
                
                self.mainHeader.backgroundView.snp.makeConstraints { (make) in
                    make.width.height.equalTo(width/4)
//                    make.
                }
                
                self.mainHeader.backgroundView.layer.cornerRadius = width / 2
                
//                self.mainHeader.characterImageView.snp.makeConstraints { (make) in
////                    make.
//                }
            }
            
        } else {
            self.mainHeader.snp.makeConstraints { (make) in
                make.height.equalTo(UIScreen.main.bounds.width)
            }
        }
        
    }
}



// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTVC", for: indexPath)
                    as? TitleTVC else { return UITableViewCell() }
            cell.setupConfigure()
            cell.selectionStyle = .none
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTVC", for: indexPath)
                    as? ActivityTVC else { return UITableViewCell() }
            cell.backgroundColor = .mainBackground
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        
    }
    
    
}


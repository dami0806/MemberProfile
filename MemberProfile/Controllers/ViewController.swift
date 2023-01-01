//
//  ViewController.swift
//  MemberProfile
//
//  Created by 박다미 on 2022/12/31.
//

import UIKit

final class ViewController: UIViewController {

    //테이블뷰 코드
    private let tableView = UITableView()
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var memberListManager = MemberListManager()
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableViewConstraints()
        setupTableView()
        setupNaviBar()
        setupDatas()
        
        
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        //셀 높이 설정
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemeberCell")
    }
    
    //네비게이션 바
    func setupNaviBar() {
        
    }
    func setupDatas(){
        memberListManager.makeMembersListDatas()
    }
    
    // 테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }
    }
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //다음 화면으로 이동
       // let datailVC = DetailViewController()
        
        
    }
    
}
extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
        
    }
    
    
}





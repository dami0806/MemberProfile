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
    // 네비게이션바에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableViewConstraints()
        setupTableView()
        setupNaviBar()
        setupDatas()
        // 네비게이션바 설정관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정 +모양으로 추가기능
        self.navigationItem.rightBarButtonItem = self.plusButton
       
        
    }
    // 델리게이트가 아닌 방식으로 구현할때는 화면 리프레시
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //뷰가 다시 나타날때, 테이블뷰를 리로드
        tableView.reloadData()
    }
    
    // 멤버를 추가하기 위한 다음 화면으로 이동
    @objc func plusButtonTapped(){
        // 다음화면으로 이동 (멤버는 전달하지 않음)
        let detailVC = DetailViewController()
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
    }
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        //셀 높이 설정
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    //네비게이션 바
    func setupNaviBar() {
        title = "회원 목록"
        
        
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
// 멤버를 추가하기 위한 다음 화면으로 이동

//정보 넘기기 delegate
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //다음 화면으로 이동
        let detailVC = DetailViewController()
        
        // 다음 화면에 멤버를 전달
        //memberList 가져오기
        let currentMember = memberListManager.getMemberList()[indexPath.row]
        detailVC.member = currentMember
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        //셀에 멤버 전달(셀에서 didSet으로)
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
       return cell
        
    }
    
    
}






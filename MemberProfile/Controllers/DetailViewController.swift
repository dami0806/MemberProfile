//
//  DetailViewController.swift
//  MemberProfile
//
//  Created by 박다미 on 2023/01/03.
//

//savebtn 눌렸을때
import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    //전달받을 멤버
    var member: Member?
    //view를 detailview로 설정
    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupButtonAction()
        
        
        // Do any additional setup after loading the view.
    }
    // 멤버를 뷰에 전달
    private func setupData() {
        detailView.member = member
    }
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    //뷰에 있는 버튼의 타겟 설정
    @objc func saveButtonTapped(){
        print("버튼 눌림")
    }

    

 

}

//
//  DetailViewController.swift
//  MemberProfile
//
//  Created by 박다미 on 2023/01/03.
//

//savebtn 눌렸을때, 이미지업데이트
import UIKit
import PhotosUI
class DetailViewController: UIViewController {

    private let detailView = DetailView()
    //전달받을 멤버
    var member: Member?
    //view를 detailview로 설정
    // 대리자설정을 위한 변수(델리게이트)
    weak var delegate: MemberDelegate?
    
    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupButtonAction()
        setupTapGestures()
        
        // Do any additional setup after loading the view.
    }
    // 멤버를 뷰에 전달
    private func setupData() {
        detailView.member = member
    }
    //뷰에 있는 버튼의 타겟 설정
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    //MARK: - 이미지뷰가 눌렸을때의 동작 설정
    //제스쳐 설정 (이미지뷰가 눌리면)
    func setupTapGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    @objc func touchUpImageView(){
        print("이미지뷰 터치")
        //기본설정 세팅
        setupImagePicker()
        
    }
    func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0 //사진 선택 가능 개수
        configuration.filter = .any(of: [.images, .videos])
        //기본설정를 갖고 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        //피커뷰컨트롤러 대리자설정
        picker.delegate = self
        //피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    
    
    
    //MARK: - SAVE버튼 또는 UPDATE버튼이 눌렸을때의 동작
    @objc func saveButtonTapped(){
        print("버튼 눌림")
        
        // [1] 멤버가 없다면 (새로운 멤버를 추가하는 화면)
        if member == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
    
            //새로운 멤버 구조체 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            //델리게이트 아닌 방식 전 화면인 vc에 접근해서 id를 index처럼 가져와서 접근
            //viewController detailVC 배열로 볼때 VC:    0번째 배열 detail: 1번째 배열
            //                   count 로 볼때: detail: 1        VC: 2
            //naviCV: cv들의 배열 b
            
            //delegate사용 안했을때 쓴 코드
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            vc.memberListManager.makeNewMember(newMember)
             
            delegate?.addNewMember(newMember)
            
        
        }
        
        // [2] 멤버가 있다면 (멤버의 내용을 업데이트 하기 위한 설정)
        else {
            member!.memberImage = detailView.mainImageView.image
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            //(뷰컨트롤러 -> 뷰)
            detailView.member = member
            
            //delegate사용 안했을때 쓴 코드
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 업데이트
//            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            delegate?.update(index: memberId, member!)
            
            
        }
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
        
    }
}

//MARK: - 피커뷰 델리게이트 설정

extension DetailViewController: PHPickerViewControllerDelegate {
    // 사진이 선택이 된 후에 호출되는 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //피커퓨 dismiss
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
    
}












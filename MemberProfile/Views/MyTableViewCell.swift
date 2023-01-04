//
//  MyTableViewCell.swift
//  MemberProfile
//
//  Created by 박다미 on 2023/01/01.
//

//코드로 cell 만듦.
import UIKit

class MyTableViewCell: UITableViewCell {
    //MARK: - 멤버 저장속성 구현
    // 멤버가 변할때마다 자동으로 업데이트 되도록 구현 didSet(속성 감시자)
    
    var member: Member? {
        didSet {
            //세팅 member 접근
            guard var member = member else {return }
            mainImageView.image = member.memberImage //optional binding 해서 ? 필요없음
            memberNameLabel.text = member.name
            addressLabel.text = member.address
            
            
        }
    }

    //MARK: - UI구현
    
    //이미지뷰 만들기
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //label 만들고 stackview 묶기
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
        
    }()
    
    //MARK: - 생성자 셋팅
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    //지정새성자: 저장속성 세팅하려고
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        
        

    }
    //지정생성자 사용하면 필수 생성자가 자동생성안되니 반드시 구현 해야함
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
  
    
    
    func setupStackView() {
        self.addSubview(mainImageView)

        // 셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    //MARK: - 오토레이아웃 셋팅
    // 오토레이아웃 정하는 정확한 시점
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2 //정확히 원으로 만들기
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 60),
            mainImageView.widthAnchor.constraint(equalToConstant: 60),
            
            // self.leadingAnchor로 잡는 것보다 self.contentView.leadingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            
            // self.trailingAnchor로 잡는 것보다 self.contentView.trailingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    

    
    
    
//    //이건 스토리보드로 짤때 사용 -> 코드사용시 생성자 이용
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

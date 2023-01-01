//
//  MyTableViewCell.swift
//  MemberProfile
//
//  Created by 박다미 on 2023/01/01.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    //이미지뷰 만들기
    
    //label 만들고 stackview 묶기
    
  
    
    
//생성자
    
    
    //지정새성자: 저장속성 세팅하려고
    
    //지정생성자 사용하면 필수 생성자가 자동생성안되니 반드시 구현 해야함
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        //setupStackView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    //이건 스토리보드로 짤때 사용 -> 코드사용시 생성자 이용
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

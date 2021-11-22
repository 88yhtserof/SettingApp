//
//  ViewController.swift
//  SettingApp
//
//  Created by limyunhwi on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    var settingModel = [[SettingModel]]() //이중 배열
    
    @IBOutlet var settingTableView: UITableView!
    
    func makeData() {
        //첫 번째 메뉴 묶음 첫 번째 섹션
        settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTile: "Set up iCloud, the App Store, and more", rightImageName: nil)]
        )
        //두 번째 메뉴 묶음 두 번째 섹션
        settingModel.append(
            [SettingModel(leftImageName: "gear", menuTitle: "General", subTile: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTile: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTile: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //테이블 뷰의 프로토콜의 데리게이트를 self로 지정하겠다.
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)//255에 가까울 수록 밝은색
        
        //테이블 뷰에 셀 등록
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        makeData()
    }

}

//프로토콜을 채택하면 클래스가 커질 우려가 있기 때문에, extension을 사용한다.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //한 어떤 섹션의 행의 개수
        //Row의 개수는 특정 숫자로 정해져 있는게 아니라 섹션에 따라 개수가 정해져야한다.
        //인덱스는 section 번호와 일치
        //배열 settingModel은 이중배열이다.
        //섹션의 row값, 즉 섹션의 행의 값은 settingModel의 한 원소의 원소 개수
        return settingModel[section].count
    }
    
    //section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 셀을 보여줄 것인지 설정.
        //재사용 가능한 데이블 뷰 셀 객체를 반환한다.그리고 그 셀 객체를 테이블 뷰에 추가한다.
        //IndexPath: 순서적인 개념
        
        if indexPath.section == 0 {//첫 번째 행(cell)일 경우
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImgView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomTitle.text = settingModel[indexPath.section][indexPath.row].subTile
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
    
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .gray
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "") //UIImage는 옵셔널값을 할당받을 수 없다.
        
        return cell
    }
    
    
}

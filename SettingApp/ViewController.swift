//
//  ViewController.swift
//  SettingApp
//
//  Created by limyunhwi on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //테이블 뷰의 프로토콜의 데리게이트를 self로 지정하겠다.
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        //테이블 뷰에 셀 등록
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }

}

//프로토콜을 채택하면 클래스가 커질 우려가 있기 때문에, extension을 사용한다.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //행의 개수
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 셀을 보여줄 것인지 설정.
        //재사용 가능한 데이블 뷰 셀 객체를 반환한다.그리고 그 셀 객체를 테이블 뷰에 추가한다.
        //IndexPath: 순서적인 개념
        
        if indexPath.row == 0 {//첫 번째 행(cell)일 경우
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        return cell
    }
    
    
}

//
//  MainController.swift
//  day_11
//
//  Created by lee on 2021/11/01.
//

import UIKit

//전역 변수
var txtArr = ["도서구매","친구 만나기","스터디"]
var imgArr = [UIImage(named: "cart.png"),
              UIImage(named: "clock.png"),
              UIImage(named: "pencil.png")]


let newImgArr = [UIImage(named: "asd.jpg"),
              UIImage(named: "cvb.jpg"),
              UIImage(named: "klj.jpg"),
              UIImage(named: "oiu.jpg")]


class MainController: UITableViewController {
    
    
    
    
    @IBOutlet var tvList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // 편집 버튼을 왼쪽으로 이동
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    // 칸 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return txtArr.count
    }

    // 각 행 정보
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel!.text = txtArr[indexPath.row]
        cell.imageView?.image = imgArr[indexPath.row]
        

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // 삭제 실행
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("삭제한다", indexPath.row)
            txtArr.remove(at: indexPath.row)
            imgArr.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // 이동
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //번호
        let old = fromIndexPath.row
        let new = to.row
        
        //데이터 저장
        let txtData = txtArr[old]
        let imgData = imgArr[old]
        
        //배열에서 삭제
        txtArr.remove(at: old)
        imgArr.remove(at: old)

        //추가
        txtArr.insert(txtData, at: new)
        imgArr.insert(imgData, at: new)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //print(segue.identifier)
        if segue.identifier == "sgDetail"{
            let detailCon = segue.destination as! DetailController
            
            let selCell = sender as! UITableViewCell
            
            let no = tvList.indexPath(for: selCell)?.row
            
                //print(no)
            
            detailCon.ttt = no!
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear() 실행")
        tvList.reloadData()  //테이블뷰 데이터 다시 로드
    }
}

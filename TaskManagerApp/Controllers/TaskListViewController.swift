//
//  TaskListViewController.swift
//  TaskManagerApp
//
//  Created by Ferhat Taşlı on 17.11.2024.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var personalTasks: [PersonalTask] = [
        PersonalTask(title: "Kitap Oku",description: "Haftalık okuma listeni tamamla")
        ,PersonalTask(title: "Yemek Yap",description: "Haftalık yemek listesi tamamla")
        ,PersonalTask(title: "Yapılacakları Listele",description: "Haftalık yapılacakları listesi tamamla")
    ]
    
    var workTaks: [WorkTask] = [
        WorkTask(title: "Sunumu Tamamla", deadline: "2024-11-20"),
        WorkTask(title: "Müşteri E-posta Cevapla", deadline: "2024-11-22"),
        WorkTask(title: "Evde Yapılacakları Listele", deadline:"2024-11-24")
        ]
    
    let tableView = UITableView()
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Görev Listesi"
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Kişisel Görevler" : "İş Görevleri"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? personalTasks.count : workTaks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        if indexPath.section == 0 {
            let task = personalTasks[indexPath.row]
            cell.configure(with: task.title, subtitle: task.description ?? "Merhaba")
        } else {
            let task = workTaks[indexPath.row]
            cell.configure(with: task.title, subtitle: "Son Tarih : \(task.deadline)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
            var task = personalTasks[indexPath.row]
            task.markAsCompleted()
            personalTasks[indexPath.row] = task
        } else {
            var task = workTaks[indexPath.row]
            task.markAsCompleted()
            workTaks[indexPath.row] = task
        }
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

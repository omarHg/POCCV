//  
//  CompetenciesViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 16/03/24.
//

import UIKit

final class CompetenciesViewController: BaseController {
    @IBOutlet private weak var tableview: UITableView!
    @IBOutlet private weak var txtCompetence: UITextField!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var sliderLbl: UILabel!

    var competencies: [CompetenceEntity] = []
    let reuseIdentifier = "CompetenciesCell"
    var sliderValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String.Localized.competencesTitle
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: reuseIdentifier)
        txtCompetence.inputAccessoryView = addToolBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        
    }
    
    func getData() {
        do {
            competencies = (try? UserDefaults.standard.get()) ?? []
            print(competencies)
            sliderLbl.text = "\(sliderValue)/10"
            tableview.reloadData()
        }
    }
    
    @IBAction func changeValue(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        sliderLbl.text = "\(sliderValue)/10"
    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        let controller = CVFinalViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tapAdd(_ sender: UIButton) {
        guard let title = txtCompetence.text, !title.isEmpty else {
            showAlertMessage(title: .Localized.emptyField,
                             message: .Localized.isRequired)
            return
        }
        let new = CompetenceEntity(id: competencies.count,
                                   title: title,
                                   value: sliderValue)
        competencies.append(new)
        UserDefaults.standard.save(entity: competencies)
        tableview.reloadData()
    }
}

extension CompetenciesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CompetenciesCell else {
            return UITableViewCell()
        }
        let values = competencies[indexPath.row]
        cell.titleLbl.text = values.title + "\n\(values.value)/10"
        return cell
    }
}

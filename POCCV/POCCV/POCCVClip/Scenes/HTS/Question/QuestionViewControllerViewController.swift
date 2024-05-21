//  
//  QuestionViewControllerViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 06/05/24.
//

import UIKit

final class QuestionViewControllerViewController: BaseController {
  
    @IBOutlet private weak var tableview: UITableView!
    @IBOutlet private weak var viewProgress: UIView!
    @IBOutlet private weak var stackProgess: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    var multiplier: CGFloat = 0.0
    var question: QuestionElement?
    let reuseIdentifier = "AnswerTableViewCell"
    let exitBottomSheet = ExitBottomSheetViewController()
    var answers: [ChoiceAnswer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigacion()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: reuseIdentifier)
        viewProgress.translatesAutoresizingMaskIntoConstraints = false
        viewProgress.widthAnchor.constraint(equalTo: stackProgess.widthAnchor, multiplier: 1.0/5.0*multiplier).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = question?.value
        descriptionLabel.text = question?.description
    }
    
    func configureNavigacion() {
        let exit = UIBarButtonItem(title: "Salir",
                                         style: .plain,
                                         target: self,
                                         action: #selector(close))
        
        exit.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.semibold16], for: .normal)
        navigationItem.rightBarButtonItems = [exit]
    }
    
    @objc func close() {
        exitBottomSheet.modalPresentationStyle = .overFullScreen
        exitBottomSheet.delegate = self
        present(exitBottomSheet, animated: true)
    }
    
    func showNextQuestion(model: ChoiceAnswer) {
        answers.append(model)
        guard let nextQuestion = question?.nextQuestion else {
            showFinish()
            return
        }
        let questionary: GetQuestionary.Response = .init()
        let view = QuestionViewControllerViewController()
        let question = questionary.questions.first(where: {$0.questionID == nextQuestion.nextQuestionID })
        view.question = question
        view.multiplier = multiplier + 1.0
        view.answers = answers
        navigationController?.pushViewController(view, animated: true)
    }
    
    func showFinish() {
        let view = FirstStepsViewController()
        view.firstStepViewModel = FirstStepViewModel(answers: answers)
        navigationController?.pushViewController(view, animated: true)
    }
}

extension QuestionViewControllerViewController: ExitBottomSheetViewDelegate {
    func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
}


extension QuestionViewControllerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.choiceAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? AnswerTableViewCell,
              let model = question?.choiceAnswers[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = question?.choiceAnswers[indexPath.row] else {
            return
        }
        showNextQuestion(model: model)
    }
}


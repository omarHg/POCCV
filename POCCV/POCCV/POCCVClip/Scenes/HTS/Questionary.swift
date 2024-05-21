//
//  Questionary.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 06/05/24.
//

import UIKit

// MARK: - QuestionElement
class QuestionElement: Codable {
    var pk: String
    var sk: String
    var gsi1Pk: String
    var gsi1Sk: String
    var questionID: String
    var questionKey: String
    var questionnaireID: String
    var organizationID: String
    var sectionID: String
    var sectionType: String
    var nextQuestion: NextQuestion?
    var value: String
    var description: String
    var choiceAnswers: [ChoiceAnswer]
    var questionType: String
    var metadata: Metadata?
    var questionNumber: Int
    var totalQuestions: Int
    var isEndOfSection: Bool
    var previousQuestionID: String?
    
    enum CodingKeys: String, CodingKey {
        case pk = "PK"
        case sk = "SK"
        case gsi1Pk = "GSI1PK"
        case gsi1Sk = "GSI1SK"
        case questionID = "QuestionId"
        case questionKey = "QuestionKey"
        case questionnaireID = "QuestionnaireId"
        case organizationID = "OrganizationId"
        case sectionID = "SectionId"
        case sectionType = "SectionType"
        case nextQuestion = "NextQuestion"
        case value = "Value"
        case description = "Description"
        case choiceAnswers = "ChoiceAnswers"
        case questionType = "QuestionType"
        case metadata = "Metadata"
        case questionNumber = "QuestionNumber"
        case totalQuestions = "TotalQuestions"
        case isEndOfSection = "IsEndOfSection"
        case previousQuestionID = "PreviousQuestionId"
    }
    
    init(pk: String, sk: String, gsi1Pk: String, gsi1Sk: String, questionID: String, questionKey: String, questionnaireID: String, organizationID: String, sectionID: String, sectionType: String, nextQuestion: NextQuestion?, value: String, description: String, choiceAnswers: [ChoiceAnswer], questionType: String, metadata: Metadata?, questionNumber: Int, totalQuestions: Int, isEndOfSection: Bool, previousQuestionID: String?) {
        self.pk = pk
        self.sk = sk
        self.gsi1Pk = gsi1Pk
        self.gsi1Sk = gsi1Sk
        self.questionID = questionID
        self.questionKey = questionKey
        self.questionnaireID = questionnaireID
        self.organizationID = organizationID
        self.sectionID = sectionID
        self.sectionType = sectionType
        self.nextQuestion = nextQuestion
        self.value = value
        self.description = description
        self.choiceAnswers = choiceAnswers
        self.questionType = questionType
        self.metadata = metadata
        self.questionNumber = questionNumber
        self.totalQuestions = totalQuestions
        self.isEndOfSection = isEndOfSection
        self.previousQuestionID = previousQuestionID
    }
}

// MARK: - ChoiceAnswer
class ChoiceAnswer: Codable {
    var answerID: String
    var value: String
    var answerKey: String
    var points: Double
    var description: String
    var answerResultText: AnswerResultText
    
    enum CodingKeys: String, CodingKey {
        case answerID = "AnswerId"
        case value = "Value"
        case answerKey = "AnswerKey"
        case points = "Points"
        case description = "Description"
        case answerResultText = "AnswerResultText"
    }
    
    init(answerID: String, value: String, answerKey: String, points: Double, description: String, answerResultText: AnswerResultText) {
        self.answerID = answerID
        self.value = value
        self.answerKey = answerKey
        self.points = points
        self.description = description
        self.answerResultText = answerResultText
    }
}

enum AnswerResultText: String, Codable {
    case empty = ""
    case excelenteNOSEncantaQueEstesUnPasoAdelante = "¡Excelente! Nos encanta que estes un paso adelante."
    case noTePreocupesEstarAquíEsUnPrimerGranPaso = "¡No te preocupes! Estar aquí es un primer gran paso."
}

// MARK: - Metadata
class Metadata: Codable {
    var indicationsNote: String
    
    enum CodingKeys: String, CodingKey {
        case indicationsNote = "IndicationsNote"
    }
    
    init(indicationsNote: String) {
        self.indicationsNote = indicationsNote
    }
}

// MARK: - NextQuestion
class NextQuestion: Codable {
    var resolutionType: String
    var nextQuestionID: String
    
    enum CodingKeys: String, CodingKey {
        case resolutionType = "ResolutionType"
        case nextQuestionID = "NextQuestionId"
    }
    
    init(resolutionType: String, nextQuestionID: String) {
        self.resolutionType = resolutionType
        self.nextQuestionID = nextQuestionID
    }
}

struct GetQuestionary {
    struct Response: Decodable {
        public let questions: [QuestionElement]
        
        public init() {
            let decoder = JSONDecoder()
            if let questions = try? decoder.decode([QuestionElement].self, from: htsJSON) {
                self.questions = questions
            } else {
                self.questions = []
            }
        }
    }
}



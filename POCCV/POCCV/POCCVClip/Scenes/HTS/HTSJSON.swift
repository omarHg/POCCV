//
//  HTSJSON.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 06/05/24.
//

import Foundation

var htsJSON: Data {
    """
[
    {
        "PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#ORGANIZATION#$ORGANIZATION_ID",
        "SK": "QUESTION#188fb872-00a0-4d02-9975-b7d82519c5aa",
        "GSI1PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#SECTION_TYPE#Experience#ORGANIZATION#$ORGANIZATION_ID",
        "GSI1SK": "QUESTION#188fb872-00a0-4d02-9975-b7d82519c5aa",
        "QuestionId": "188fb872-00a0-4d02-9975-b7d82519c5aa",
        "QuestionKey": "initial-profiler-experience",
        "QuestionnaireId": "bab67b71-3d71-4e8d-b0ae-bf38648417eb",
        "OrganizationId": "$ORGANIZATION_ID",
        "SectionId": "243a150a-f7be-4058-886b-ec345fea7cb7",
        "SectionType": "Experience",
        "NextQuestion": {
            "ResolutionType": "Single",
            "NextQuestionId": "6153ce6a-1189-4a8e-8487-3f409890d525"
        },
        "Value": "Cuéntanos, ¿cuál es tu experiencia en inversiones?",
        "Description": "Nos ayudará a entender qué productos son más adecuados para tu experiencia.",
        "ChoiceAnswers": [
          {
            "AnswerId": "4c2242ec-48bf-410e-a320-4dd28d747abc",
            "Value": "Sin experiencia",
            "AnswerKey": "initial-profiler-experience-without",
            "Points": 0,
            "Description": "Nunca he invertido.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "7a624ac4-e0df-46bc-b6b4-ebefe0038e4a",
            "Value": "Poca experiencia",
            "AnswerKey": "initial-profiler-experience-bit",
            "Points": 1.6667,
            "Description": "Invierto en cuentas que me generan rendimientos.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "3f3fc3ff-1ab9-40f0-a413-74e9e22c476e",
            "Value": "Algo de experiencia",
            "AnswerKey": "initial-profiler-experience-some",
            "Points": 2.7778,
            "Description": "Conozco sobre fondos de inversión, CETES y acciones.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "ddc6073c-dd0b-4381-af95-1193f0ad7d6f",
            "Value": "Buena experiencia",
            "AnswerKey": "initial-profiler-experience-good",
            "Points": 3.8889,
            "Description": "Hago mis propias transacciones, entiendo el mercado y tomo decisiones a partir de ello.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "819b85a0-6416-4dad-a322-567092ed0e12",
            "Value": "Mucha experiencia",
            "AnswerKey": "initial-profiler-experience-a-lot-of",
            "Points": 5,
            "Description": "Dedico gran parte de mi tiempo a dar seguimiento a mis inversiones y genero ingresos de ello.",
            "AnswerResultText": ""
          }
        ],
        "QuestionType": "Select",
        "Metadata": {
            "IndicationsNote": ""
        },
        "QuestionNumber": 1,
        "TotalQuestions": 5,
        "IsEndOfSection": false
    },
    {
        "PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#ORGANIZATION#$ORGANIZATION_ID",
        "SK": "QUESTION#6153ce6a-1189-4a8e-8487-3f409890d525",
        "GSI1PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#SECTION_TYPE#None#ORGANIZATION#$ORGANIZATION_ID",
        "GSI1SK": "QUESTION#6153ce6a-1189-4a8e-8487-3f409890d525",
        "QuestionId": "6153ce6a-1189-4a8e-8487-3f409890d525",
        "QuestionKey": "initial-profiler-emergency-fund",
        "QuestionnaireId": "bab67b71-3d71-4e8d-b0ae-bf38648417eb",
        "OrganizationId": "$ORGANIZATION_ID",
        "SectionId": "37458e7a-859f-44df-9f76-b4a59a93a834",
        "SectionType": "WithoutSection",
        "NextQuestion": {
            "ResolutionType": "Single",
            "NextQuestionId": "ef7e28d6-b337-47fd-8c1e-3f68e62a7cfb"
        },
        "PreviousQuestionId":"188fb872-00a0-4d02-9975-b7d82519c5aa",
        "Value": "Algo importante al momento de invertir, es tener un fondo de emergencias, ¿cuentas con ahorros que cubran 3 meses de tus gastos?",
        "Description": "",
        "ChoiceAnswers": [
          {
            "AnswerId": "b3a85c4d-7566-40f0-b7e6-94d7a72af2a5",
            "Value": "Sí",
            "AnswerKey": "initial-profiler-emergency-fund-yes",
            "Points": 0,
            "Description": "Tengo suficientes ahorros para cubrir mis gastos o alguna emergencia.",
            "AnswerResultText": "¡Excelente! Nos encanta que estes un paso adelante."
          },
          {
            "AnswerId": "b62c3d9f-07b5-4415-acb3-4b70741dd635",
            "Value": "No",
            "AnswerKey": "initial-profiler-emergency-fund-no",
            "Points": 0,
            "Description": "No tengo ahorros o un fondo de emergencias.",
            "AnswerResultText": "¡No te preocupes! Estar aquí es un primer gran paso."
          }
        ],
        "QuestionType": "Select",
        "QuestionNumber": 2,
        "TotalQuestions": 5,
        "IsEndOfSection": false
    },
    {
        "PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#ORGANIZATION#$ORGANIZATION_ID",
        "SK": "QUESTION#ef7e28d6-b337-47fd-8c1e-3f68e62a7cfb",
        "GSI1PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#SECTION_TYPE#Capacity#ORGANIZATION#$ORGANIZATION_ID",
        "GSI1SK": "QUESTION#ef7e28d6-b337-47fd-8c1e-3f68e62a7cfb",
        "QuestionId": "ef7e28d6-b337-47fd-8c1e-3f68e62a7cfb",
        "QuestionKey": "initial-profiler-capacity",
        "QuestionnaireId": "bab67b71-3d71-4e8d-b0ae-bf38648417eb",
        "OrganizationId": "$ORGANIZATION_ID",
        "SectionId": "b382538c-ae50-430b-9547-da634bae16d5",
        "SectionType": "Capacity",
        "NextQuestion": {
            "ResolutionType": "Single",
            "NextQuestionId": "7d4cb5cd-6a8f-4751-bd96-413f0a7d8beb"
        },
        "PreviousQuestionId":"6153ce6a-1189-4a8e-8487-3f409890d525",
        "Value": "En comparación con el resto de tu patrimonio, ¿qué porcentaje quieres invertir en GBM?",
        "Description": "",
        "ChoiceAnswers": [
          {
            "AnswerId": "0bf39dd6-86d0-4547-affc-e0935a5173f1",
            "Value": "Bajo",
            "AnswerKey": "initial-profiler-capacity-low",
            "Points": 9,
            "Description": "Menos del 10%",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "ca6280a6-1d9d-4b35-9880-96cf067c98ca",
            "Value": "Medio",
            "AnswerKey": "initial-profiler-capacity-medium",
            "Points": 7,
            "Description": "Del 11% al 20%",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "76f45fbf-406f-46f3-81cf-af622b5f8a35",
            "Value": "Alto",
            "AnswerKey": "initial-profiler-capacity-high",
            "Points": 3,
            "Description": "Entre el 21% y 35%",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "08462ed2-0b1e-4cc9-a335-d210bd00bc49",
            "Value": "Muy alto",
            "AnswerKey": "initial-profiler-capacity-very-high",
            "Points": 0,
            "Description": "Mas del 35%",
            "AnswerResultText": ""
          }
        ],
        "QuestionType": "Select",
        "QuestionNumber": 3,
        "TotalQuestions": 5,
        "IsEndOfSection": false
    },
    {
        "PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#ORGANIZATION#$ORGANIZATION_ID",
        "SK": "QUESTION#7d4cb5cd-6a8f-4751-bd96-413f0a7d8beb",
        "GSI1PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#SECTION_TYPE#RiskTolerance#ORGANIZATION#$ORGANIZATION_ID",
        "GSI1SK": "QUESTION#7d4cb5cd-6a8f-4751-bd96-413f0a7d8beb",
        "QuestionId": "7d4cb5cd-6a8f-4751-bd96-413f0a7d8beb",
        "QuestionKey": "initial-profiler-risk-tolerance",
        "QuestionnaireId": "bab67b71-3d71-4e8d-b0ae-bf38648417eb",
        "OrganizationId": "$ORGANIZATION_ID",
        "SectionId": "4c1cfb3d-6bcb-4f14-8257-7359347925b0",
        "SectionType": "RiskTolerance",
        "NextQuestion": {
            "ResolutionType": "Single",
            "NextQuestionId": "59cc0cf7-f219-49fe-810f-283a850731c9"
        },
        "PreviousQuestionId":"ef7e28d6-b337-47fd-8c1e-3f68e62a7cfb",
        "Value": "¿Cuál de estos enunciados refleja mejor tu actitud ante el riesgo al invertir?",
        "Description": "",
        "ChoiceAnswers": [
          {
            "AnswerId": "088f5d84-e02c-4bcc-b641-11f8e2ccbeb8",
            "Value": "No me gusta el riesgo",
            "AnswerKey": "initial-profiler-risk-low",
            "Points": 9,
            "Description": "No estoy preparado para ver caídas en el valor de mis inversiones.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "f9c6fc7c-1820-44bf-820a-64bbac4eb795",
            "Value": "Puedo asumir pérdidas a corto plazo",
            "AnswerKey": "initial-profiler-risk-medium",
            "Points": 7,
            "Description": "Siento comodidad con pequeñas pérdidas para generar un rendimiento adicional.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "6d5a9614-979e-4961-9ac7-0c1d36a036df",
            "Value": "Puedo asumir pérdidas más grandes al corto plazo",
            "AnswerKey": "initial-profiler-risk-high",
            "Points": 3,
            "Description": "Estoy preparado para asumir pérdidas temporales y obtener un mayor rendimiento a largo plazo.",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "239f938b-f4d1-482d-bad5-294c8dc06f84",
            "Value": "Puedo asumir pérdidas significativas al corto plazo",
            "AnswerKey": "initial-profiler-risk-very-high",
            "Points": 0,
            "Description": "Intento maximizar mis rendimientos a largo plazo y asumir pérdidas significativas en periodos más cortos.",
            "AnswerResultText": ""
          }
        ],
        "QuestionType": "Select",
        "QuestionNumber": 4,
        "TotalQuestions": 5,
        "IsEndOfSection": false
    },
    {
        "PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#ORGANIZATION#$ORGANIZATION_ID",
        "SK": "QUESTION#59cc0cf7-f219-49fe-810f-283a850731c9",
        "GSI1PK": "QUESTIONNAIRE#bab67b71-3d71-4e8d-b0ae-bf38648417eb#SECTION_TYPE#None#ORGANIZATION#$ORGANIZATION_ID",
        "GSI1SK": "QUESTION#59cc0cf7-f219-49fe-810f-283a850731c9",
        "QuestionId": "59cc0cf7-f219-49fe-810f-283a850731c9",
        "QuestionKey": "initial-profiler-investment-advisor",
        "QuestionnaireId": "bab67b71-3d71-4e8d-b0ae-bf38648417eb",
        "OrganizationId": "$ORGANIZATION_ID",
        "SectionId": "37458e7a-859f-44df-9f76-b4a59a93a834",
        "SectionType": "WithoutSection",
        "PreviousQuestionId":"7d4cb5cd-6a8f-4751-bd96-413f0a7d8beb",
        "Value": "Para finalizar, cuéntanos, ¿cómo prefieres llevar tus inversiones?",
        "Description": "",
        "ChoiceAnswers": [
          {
            "AnswerId": "483d6b99-9f7e-4621-a875-7d912e1fcfb3",
            "Value": "Prefiero asesorarme para manejar mis inversiones",
            "AnswerKey": "initial-profiler-investment-advisor-yes",
            "Points": 0,
            "Description": "",
            "AnswerResultText": ""
          },
          {
            "AnswerId": "c2424454-391c-479c-8ad7-a095302fa503",
            "Value": "Prefiero manejar mis inversiones por mi cuenta",
            "AnswerKey": "initial-profiler-investment-advisor-no",
            "Points": 0,
            "Description": "",
            "AnswerResultText": ""
            
          }
        ],
        "QuestionType": "Select",
        "QuestionNumber": 5,
        "TotalQuestions": 5,
        "IsEndOfSection": true
    }
]
""".utf8Data
}

extension String {
    var utf8Data: Data {
        data(using: .utf8) ?? Data()
    }
}


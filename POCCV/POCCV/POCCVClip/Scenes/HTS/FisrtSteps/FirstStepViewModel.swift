//
//  FirstStepViewModel.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 21/05/24.
//

import Foundation

struct FirstStepViewModel {
    var answers: [ChoiceAnswer] = []
    
    init(answers: [ChoiceAnswer]) {
        self.answers = answers
    }
    
    var emergencyFund: Bool {
        return answers.contains(where: {$0.answerID == "b3a85c4d-7566-40f0-b7e6-94d7a72af2a5"})
    }
    
    var advisory: Bool {
        return answers.contains(where: {$0.answerID == "483d6b99-9f7e-4621-a875-7d912e1fcfb3"})
    }
    
    var title: String {
        if emergencyFund, advisory {
            return "Crea tu meta a corto plazo"
        } else if !emergencyFund, advisory {
            return "Crea una meta destinada a fondo de emergencias"
        } else if !emergencyFund, !advisory {
            return "Crea un fondo de emergencias Smart Cash"
        }  else if emergencyFund, !advisory {
            return "Ahorro inteligente con Smart Cash"
        }
        return ""
    }
    
    var smartSavingtitle: String {
        if advisory {
            return "Ahorro inteligente con Smart Cash"
        } else if !advisory {
            return "Tú decides cómo y cuando invertir"
        }
        return ""
    }
    
    var smartSavingDesc: String {
        if advisory {
            return "Tu dinero crece con una tasa estimada anual del 9.00% *"
        } else if !advisory {
            return "Descubre el top 10 de instrumentos más vendidos en la bolsa."
        }
        return ""
    }
    
    var desc: String {
        if emergencyFund, advisory {
            return "Las vacaciones, un nuevo auto o lo que prefieras. Tú decides qué lograr."
        } else if !emergencyFund, advisory {
            return "Prepárate ante cualquier imprevisto."
        } else if !emergencyFund, !advisory {
            return "Prepárate ante cualquier imprevisto."
        }  else if emergencyFund, !advisory {
            return "Alcanza tus aspiraciones financieras con las opciones que tenemos para ti."
        }
        return ""
    }
    
    var checksViews: [CheckView] {
        if emergencyFund, advisory {
            let view1 = createCheckView(model: CheckViewModel(title: "Liquidez diaria",
                                                          desc: "Retira todos los días hábiles en horario operativo de 7:30 a 13:00 horas."))
            let view2 = createCheckView(model: CheckViewModel(title: "Rendimiento del 10.4%*",
                                                              desc: "Conoce el detalle de tu inversión y lleva un seguimiento constante."))
            let view3 = createCheckView(model: CheckViewModel(title: "Inversión en manos de expertos",
                                                              desc: "Deposita y despreocúpate, nosotros nos encargamos de hacer crecer tu dinero. "))
            
            return [view1, view2, view3]
        } else if !emergencyFund, advisory {
            let view1 = createCheckView(model: CheckViewModel(title: "Liquidez diaria",
                                                          desc: "Retira todos los días hábiles en horario operativo de 7:30 a 13:00 horas."))
            let view2 = createCheckView(model: CheckViewModel(title: "Rendimiento del 10.4%*",
                                                              desc: "Conoce el detalle de tu inversión y lleva un seguimiento constante."))
            let view3 = createCheckView(model: CheckViewModel(title: "Inversión en manos de expertos",
                                                              desc: "Deposita y despreocúpate, nosotros nos encargamos de hacer crecer tu dinero. "))
            return [view1, view2, view3]
        } else if !emergencyFund, !advisory {
            let view1 = createCheckView(model: CheckViewModel(title: "Liquidez diaria",
                                                          desc: "Retira todos los días hábiles en horario operativo de 7:30 a 13:00 horas."))
            let view2 = createCheckView(model: CheckViewModel(title: "Rendimiento anual del 9.00% *",
                                                              desc: "Haz crecer tus ahorros y obtén rendimientos en tu cuenta todos los días."))
            let view3 = createCheckView(model: CheckViewModel(title: "Sin saldo mínimo ni comisiones",
                                                              desc: "Empieza tu ahorro hoy, sin importar el monto de tu inversión."))
            return [view1, view2, view3]
        }  else if emergencyFund, !advisory {
            let view1 = createCheckView(model: CheckViewModel(title: "Liquidez diaria",
                                                          desc: "Retira todos los días hábiles en horario operativo de 7:30 a 13:00 horas."))
            let view2 = createCheckView(model: CheckViewModel(title: "Rendimiento anual del 9.00% *",
                                                              desc: "Haz crecer tus ahorros y obtén rendimientos en tu cuenta todos los días."))
            let view3 = createCheckView(model: CheckViewModel(title: "Sin saldo mínimo ni comisiones",
                                                              desc: "Empieza tu ahorro hoy, sin importar el monto de tu inversión."))
            return [view1, view2, view3]
        }
        return []
    }
    
    var blueButtonTitle: String {
        if advisory {
            return "Crear meta"
        } else if !advisory {
            return "Depositar a Smart Cash"
        }
        return "-"
    }
    
    var grayButtonTitle: String {
        if advisory {
            return "Depositar a Smart Cash"
        } else if !advisory {
            return "Explorar Market"
        }
        return "-"
    }
    
    var anualRate: String {
        if advisory {
            return "* La tasa anual que puedes llegar a obtener está basada en la tasa de referencia del Banco de México y puede sufrir cambios en cualquier momento."
        } else if !advisory {
            return ""
        }
        return ""
    }

    
    func createCheckView(model: CheckViewModel) -> CheckView {
        let view: CheckView = CheckView()
        view.configure(model: model)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

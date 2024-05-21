//
//  CVFinalViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 14/03/24.
//

import UIKit
import PDFKit

final class CVFinalViewController: BaseController {
    @IBOutlet private weak var rightStack: UIStackView!
    @IBOutlet private weak var nameSectionView: CVPersonalNameView!
    @IBOutlet private weak var personalSectionView: CVSectionView!
    @IBOutlet private weak var employementSectionView: CVSectionView!
    @IBOutlet private weak var academySectionView: CVSectionView!
    @IBOutlet private weak var detailsLbl: UILabel!
    @IBOutlet private weak var birtdateLbl: UILabel!
    @IBOutlet weak var scrollViewContent: UIView!
    @IBOutlet weak var inviteView: InviteView!
    var exportoBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersonalData()
        getAcademyData()
        getEmployementData()
        getContantData()
        exportoBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.down.doc.fill"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(exportPDF))
        navigationItem.rightBarButtonItems = [exportoBtn]
        rightStack.setCustomSpacing(24.0, after: detailsLbl)
        inviteView.tapDownload = { [weak self] in
            self?.displayOverlay()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayOverlay()
    }
    
    @objc func exportPDF() {
        inviteView.isHidden = false
        let items = [scrollViewContent.asImage()]
        let ac = UIActivityViewController(activityItems: items,
                                          applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            ac.popoverPresentationController?.barButtonItem = exportoBtn
        }
        DispatchQueue.main.async { [weak self] in
            self?.present(ac, animated: true)
        }
        //createPdfFromView(aView: scrollViewContent, saveToDocumentsWithFileName: "CV" + Date().string(format: "ddMMyyhhmmss"))
    }
    
    func getPersonalData() {
        do {
            let personalData: PersonalInformationEntity? = try? UserDefaults.standard.get()
            guard let personalData = personalData else { return }
            print(personalData)
            nameSectionView.configureTitle(name: personalData.fullName(), title: "")
            let image = UserDefaults.standard.getPhoto()
            nameSectionView.configurePhoto(image: image)
            let item = ItemSection(desc: personalData.profile ?? "")
            let nameSection: String = .Localized.profileTitleSection
            personalSectionView.configureTitle(name: nameSection, image: UIImage(named: "person.fill"), items: [item])
            birtdateLbl.attributedText = personalData.CVBirthDateAttributes()
        }
    }
    
    func getAcademyData() {
        do {
            let academicData: [AcademicInformationEntity]? = try? UserDefaults.standard.get()
            guard let academicData = academicData else { return }
            print(academicData)
            var items: [ItemSection] = []
            for academicDatum in academicData {
                items.append(ItemSection(title: academicDatum.fullTitle(),
                                         date: academicDatum.fullDate(),
                                         desc: academicDatum.description ?? ""))
            }
            let nameSection: String = .Localized.acedemicTitleSection
            academySectionView.configureTitle(name: nameSection, image: UIImage(named: "graduationcap.fill"),
                                              items: items)
        }
    }
    
    func getEmployementData() {
        do {
            let employementData: [EmploymentHistoryEntity]? = try? UserDefaults.standard.get()
            guard let employementData = employementData else { return }
            print(employementData)
            var items: [ItemSection] = []
            for employementDatum in employementData {
                items.append(ItemSection(title: employementDatum.fullTitle(),
                                         date: employementDatum.fullDate(),
                                         desc: employementDatum.description ?? ""))
            }
            let nameSection: String = .Localized.employementTitleSection
            employementSectionView.configureTitle(name: nameSection, image: UIImage(named: "briefcase.fill"), items: items)
        }
    }
    
    func getContantData() {
        do {
            let contactData: ContactInformationEntity? = try? UserDefaults.standard.get()
            guard let contactData = contactData else { return }
            print(contactData)
            detailsLbl.attributedText = contactData.attributes()
        }
    }
    
    func createPdfFromView(aView: UIView, saveToDocumentsWithFileName fileName: String) {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        aView.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        guard let pdfDocument = PDFDocument(data: pdfData as Data) else {
            return
        }
        sharePDF(pdfDocument)
    }
    
    func sharePDF(_ filePDF: PDFDocument) {
        if let pdfData = filePDF.dataRepresentation() {
            let objectsToShare = [pdfData]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = view
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}

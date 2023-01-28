//
//  ViewController.swift
//  ASCII to HEX
//
//  Created by Sahil Yeole on 23/01/23.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var hexTextField: NSTextField!
    @IBOutlet weak var hexTitle: NSTextField!
    @IBOutlet weak var asciiLabel: NSTextField!
    @IBOutlet weak var copyButton: NSButton!
    @IBOutlet weak var convertButton: NSButton!
    @IBOutlet weak var asciiTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyButton.isHidden = true
        hexTitle.isHidden = true
        hexTextField.isHidden = true
        hexTextField.isEditable = false
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.level = .floating
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.frame = view.frame
        view.addSubview(visualEffectView)
        view.addSubview(asciiLabel)
        view.addSubview(asciiTextField)
        view.addSubview(convertButton)
        view.addSubview(hexTextField)
        view.addSubview(copyButton)
        view.addSubview(hexTitle)
        visualEffectView.state = .active
    }


    @IBAction func convertButtonClicked(_ sender: Any) {
        guard let asciiText = asciiTextField.stringValue.data(using: .ascii) else { return }
        let hexText = asciiText.map { String(format: "%02x", $0) }.joined()
        hexTextField.stringValue = hexText
        if !hexText.isEmpty {
                    copyButton.isHidden = false
            hexTitle.isHidden = false
            hexTextField.isHidden = false
                }
    }
    
    @IBAction func copyButtonClicked(_ sender: Any) {
        let hexValue = hexTextField.stringValue
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString(hexValue, forType: .string)
    }
}



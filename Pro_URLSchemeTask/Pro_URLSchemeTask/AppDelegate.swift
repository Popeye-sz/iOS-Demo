//
//  AppDelegate.swift
//  Pro_URLSchemeTask
//
//  Created by 申政 on 2022/5/5.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let vc = ViewController()
        vc.view.autoresizingMask = [.width, .height]
        window.contentViewController = vc
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}


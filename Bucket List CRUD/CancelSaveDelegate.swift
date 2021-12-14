//
//  CancelSaveDelegate.swift
//  Bucket List CRUD
//
//  Created by admin on 14/12/2021.
//

import Foundation
import UIKit

protocol CancelSaveDelegate : AnyObject {
    func cancelButtonPressed(viewcontroller : SecondTableViewController)
    func saveButtonPressed(viewcontroller : SecondTableViewController , text:String , indexpath:NSIndexPath?)
}

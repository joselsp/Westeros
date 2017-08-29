//
//  ArrayDataSourceTest.swift
//  Westeros
//
//  Created by Memphis on 24/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class ArrayDataSourceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayDataSourceCreation() {
        
        let ds = ArrayDataSource(model: [1, 2, 3, 4]) { (number: Int, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "NumberCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "El número \(number)"
            
            return cell!
        }
        
        XCTAssertNotNil(ds)                
    }
}

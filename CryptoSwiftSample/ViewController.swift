//
//  ViewController.swift
//  CryptoSwiftSample
//
//  Created by mhlee on 2020/09/11.
//  Copyright © 2020 WIWA. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // hash output
    // MD5: 16bytes
    // SHA256: 32bytes
    
    // key: SHA256(사용자 입력 비밀번호) -> 32byte
    // iv: SHA256(uid) -> 32byte
    // blockmode: CBC
    // padding: pkcs7
    
    // 또는
    // key: MD5(사용자 입력 비밀번호) -> 16byte
    // iv: MD5(uid) -> 16byte
    // blockmode: CBC
    // padding: pkcs7
    
    
    
//    do {
//      let aes = try AES(key: "keykeykeykeykeyk", iv: "drowssapdrowssap") // aes128
//      let ciphertext = try aes.encrypt(Array("Nullam quis risus eget urna mollis ornare vel eu leo.".utf8))
//      let cipherBase64 = ciphertext.toBase64()
//
//      let plaintext = try cipherBase64?.decryptBase64ToString(cipher: aes)
//      print(plaintext)
//
//      // string to Array<UInt8>
//      print("aaaa".bytes.count)
//    } catch {
//      print("error")
//    }
    
//    print("keykeykeykeykeyk".bytes.md5())
    
    do {
      // aes 128
      let aes = try AES(key: "keykeykeykeykeyk".bytes.md5(), blockMode: CBC(iv: "drowssapdrowssap".bytes.md5()))
      let ciphertext = try aes.encrypt(Array("Nullam quis risus eget urna mollis ornare vel eu leo.".utf8))
      let cipherBase64 = ciphertext.toBase64()
            
      let plaintext = try cipherBase64?.decryptBase64ToString(cipher: aes)
      print(plaintext)

      // string to Array<UInt8>
//      print("aaaa".bytes.count)
    } catch {
      print("error")
    }
  }
}


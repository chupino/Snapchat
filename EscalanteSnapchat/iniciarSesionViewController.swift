//
//  iniciarSesionViewController.swift
//  EscalanteSnapchat
//
//  Created by Mauricio Escalante on 20/05/24.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        print("Intentando iniciar Sesion")
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
              print("Se produjo un error \(error)")
            return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
              
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)
            print("Sesion iniciada")
            /*
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            (user,error) in
            print("Intentando iniciar sesión")
            if error != nil {
                print("Se presento el siguiente error: \(error)")
            }else{
                print("Inicio de sesión exitoso")
            }*/
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

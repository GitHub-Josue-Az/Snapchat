

import UIKit
import Firebase

class iniciarSesionViewControllser: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func iniciarSesionTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print("Intentamos iniciar sesion")
            if error != nil {
                print("Tenemos el siguiente error:\(String(describing: error))")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text! , completion: {(user, error) in
                    print("Intenteamos crear un usuario")
                    if error != nil {
                        print("Tenemos el siguiente error:\(String(describing: error))")
                    }else{
                        print("El usuario fue creado exitosamente")
                        
                FIRDatabase.database().reference().child("usuarios").child((user?.uid)!).child("email").setValue(user?.email)
                        
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
                
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
    

    
    
}


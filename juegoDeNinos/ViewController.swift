//
//  ViewController.swift
//  juegoDeNinos
//
//  Created by APPS2M on 21/10/21.
//

import UIKit

class ViewController: UIViewController {

    var figureName = ""
    
    //array con los nombres de las imagenes para llamarlas
    let arrayFigures = ["circulo","cuadrado","pentagono","triangulo"]
    
    //referenciar el fondo para cambiarle el color y la puntuación para actualizarla
    @IBOutlet var fondo: UIView!
    @IBOutlet weak var puntuacion: UILabel!
    var puntuacionInt = 0
    //referenciar la figura para cambiarla
    @IBOutlet weak var figure: UIImageView!
    
    //Al hacer click en cualquier figura, llamar a la funcion clickOnFigure() y pasarle el nombre de la figura del boton
    @IBAction func buttonCircle(_ sender: UIButton) {
        clickOnFigure("circulo")
    }
    
    @IBAction func buttonTriangle(_ sender: UIButton) {
        clickOnFigure("triangulo")
    }
    
    @IBAction func buttonSquare(_ sender: UIButton) {
        clickOnFigure("cuadrado")
    }
    
    @IBAction func buttonPentagon(_ sender: UIButton) {
        clickOnFigure("pentagono")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //actualizar la figura nada más abrir la aplicación para que siempre sea diferente
        updateFigure()
        // Do any additional setup after loading the view.
    }
    
    //al hacer click en la figura
    func clickOnFigure(_ buttonName: String){
        //comprueba que has acertado y actualiza todo
        if(buttonName == figureName){
            
            fondo.backgroundColor = UIColor.systemGreen //fondo verde
            updateFigure() //cambiar la figura a adivinar
            puntuacionInt += 100 //sumar puntuacion
            
        }else{ //si falla
            
            fondo.backgroundColor = UIColor.systemRed //fondo rojo
            puntuacionInt = 0 //resetea puntuación
            
        }
        puntuacion.text = String(puntuacionInt) //actualiza el texto de la puntuacion con el valor puntuacionInt
        
    }
    //actualizar la imagen
    func updateFigure() {
        figureName = arrayFigures.randomElement()! //coge un elemento aleatorio del array de imagenes
        figure.image = UIImage.init(named: figureName) //busca el nombre seleccionado aleatoriamente en las imagenes de assets y actualiza la figura con esa imagen.
        
    }
    
}


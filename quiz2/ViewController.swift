//
//  ViewController.swift
//  quiz2
//
//  Created by Estudiantes on 5/5/18.
//  Copyright © 2018 Juan Carlos Marin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblIndicadorNumero: UILabel!
    @IBOutlet weak var lblTextoPregunta: UILabel!
    @IBOutlet weak var btnSiguiente: UIButton!
    @IBOutlet weak var btnSI: UIButton!
    @IBOutlet weak var btnNO: UIButton!
    
    var arrPreguntas:[String]=["Pregunta 1","Pregunta 2","Pregunta 3","Pregunta 4","Pregunta 5","Pregunta 6","Pregunta 7","Pregunta 8","Pregunta 9","Pregunta 10","Pregunta 11","Pregunta 12","Pregunta 13","Pregunta 14","Pregunta 15","Pregunta 16","Pregunta 17","Pregunta 18","Pregunta 19","Pregunta 20"]
    var arrRespuestas:[String]=["SI","NO","NO","SI","SI","SI","NO","NO","SI","SI","SI","NO","NO","SI","SI","SI","NO","NO","SI","SI"]
    var arrUsuario:[Int]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var arrMarcada:[Int]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var total:Int = 0
    var indice:Int=0
    var puntaje:Int=0
    
    func siguientePregunta(_ numero:Int){
        if indice<total{
            lblTextoPregunta.text=arrPreguntas[numero]
            indice = indice + 1
            btnSI.backgroundColor = UIColor.gray
            btnNO.backgroundColor = UIColor.gray
            lblIndicadorNumero.text = String(indice) + "/" + String(total)
        }else{
            //final
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        total = arrPreguntas.count
        indice = 0
        puntaje=0
        siguientePregunta(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickRespuesta(_ sender: UIButton) {
        btnSI.backgroundColor = UIColor.gray
        btnNO.backgroundColor = UIColor.gray
        arrMarcada[indice-1]=1
        sender.backgroundColor = UIColor.red
        var respBtn:String = (sender.titleLabel?.text)!
        if respBtn == arrRespuestas[indice-1]{
            arrUsuario[indice-1]=1
        }else{
            arrUsuario[indice-1]=0
        }
    }
    
    @IBAction func clicSiguiente(_ sender: UIButton) {
        if indice > total{
            return
        }
        if arrMarcada[indice-1]==0{
            return
        }
        if sender.titleLabel?.text == "Terminar"{
            for ipreg in arrUsuario{
                puntaje = puntaje + ipreg
            }
            lblTextoPregunta.text="Su puntaje fue de :" + String(puntaje)
            
        }else{
            siguientePregunta(indice)
        }
        
        if indice == total{
            //sender.titleLabel?.text = "Terminar"
            sender.setTitle("Terminar", for: .normal)
        }
    }
}


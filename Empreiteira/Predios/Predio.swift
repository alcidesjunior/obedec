//
//  Predio.swift
//  Empreiteira
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Cocoa

enum Estado{
    case planejamento
    case construcao
    case venda
    case vendido
}
class Predio : Obra{
    
    var estado : Estado
    var precoMQuad : Double //preco metro quadrado
    var andares : [Andar]
    let taxaFixa : Double = 0.03
    var obra : Obra
    
    init(estado: Estado, precoMQuad : Double, andares: [Andar], obra : Obra,eng : Engenheiro, arq: Arquiteto, mest : [MestreDeObra], ped : [Pedreiro], serv : [Servente]) {
        self.precoMQuad = precoMQuad
        self.estado     = estado
        self.andares    = andares
        self.obra = obra
        super.init(eng: eng, arq: arq, mest: mest, ped: ped, serv: serv)
    }
    
    func calculaValorAp(numAndar : Int, numAp: Int)->Double{
        return (self.taxaFixa) * Double(numAndar) + ((self.andares.filter{($0.numAndar == numAndar)}).first?.apartamentos.filter{$0.numAp==numAndar}.first?.tamMQuad)!*self.precoMQuad
    }
/*
 Planejamento -> Arquiteto: Elaboracao de projeto, compra do terro, etc.
 Construcao -> Exige um terreno, engenheiro e pelo menos um mestre de obras
 Venda -> Todo predio construido, vendedores responsaveis pela venda
 Descreve a situação em que todas as unidades foram vendidas.
 */
}

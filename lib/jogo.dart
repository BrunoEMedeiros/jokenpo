import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemapp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opcão abaixo";

  void _opcaoSelecionada(String escolhaUsuario)
  {
      var opcoes = ["pedra", "papel", "tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];
      
      switch(escolhaApp){
          case "pedra":
            setState(() {
              this._imagemapp = AssetImage("images/pedra.png");
            });
          break;
          case "papel":
            setState(() {
              this._imagemapp = AssetImage("images/papel.png");
            });
          break;
          case "tesoura":
            setState(() {
              this._imagemapp = AssetImage("images/tesoura.png");
            });
          break;
      }

      if(escolhaApp == "pedra" && escolhaUsuario == "papel" || escolhaApp =="papel" && escolhaUsuario == "tesoura" || escolhaApp =="tesoura" && escolhaUsuario == "pedra")
      {
          setState(() {
            this._mensagem = "Voce ganhou!!";
          });
          
      }
      else if(escolhaApp == "papel" && escolhaUsuario == "pedra" || escolhaApp =="tesoura" && escolhaUsuario == "papel" || escolhaApp =="pedra" && escolhaUsuario == "tesoura")
      {
        setState(() {
          this._mensagem = "Voce perdeu!!";
        });
        
      }
      else
      {
          setState(() {
            this._mensagem = "Empate!!";
          });
      }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jokenpo"), 
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                //text
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 36),
                    child: Text("Escolha do app",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                        )
                      ), 
                  ),
                //imagem
                  Image(image: this._imagemapp),
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 36),
                    child: Text(
                                this._mensagem,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                        )
                      ), 
                  ),
                //text resultado
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("pedra"),
                        child: Image.asset("images/pedra.png", height: 95),
                    ),
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("papel"),
                        child: Image.asset("images/papel.png", height: 95),
                    ),
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("tesoura"),
                        child: Image.asset("images/tesoura.png", height: 95),
                    ),
                      /*,
                      Image.asset("imagens/papel.png", height: 95),
                      Image.asset("imagens/pesoura.png", height: 95),
                      */
                  ],
                )
                //linha
            ], 
        )
    );
  }
}
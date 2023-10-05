import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // Declaración de variables
  String _operacion = "";      // Almacena la operación actual (+, -, *, /, x²).
  double _primerNumero = 0;    // Almacena el primer número ingresado.
  double _segundoNumero = 0;   // Almacena el segundo número ingresado.
  double _resultado = 0;       // Almacena el resultado de la operación.

  // Función para sumar dos números
  double _sumar() {
    return _primerNumero + _segundoNumero;
  }

  // Función para restar dos números
  double _restar() {
    return _primerNumero - _segundoNumero;
  }

  // Función para multiplicar dos números
  double _multiplicar() {
    return _primerNumero * _segundoNumero;
  }

  // Función para dividir dos números
  double _dividir() {
    return _primerNumero / _segundoNumero;
  }

  // Función para realizar la suma y actualizar la interfaz
  void _onSumar() {
    _resultado = _sumar();
    _operacion = "+";
    setState(() {});
  }

  // Función para realizar la resta y actualizar la interfaz
  void _onRestar() {
    _resultado = _restar();
    _operacion = "-";
    setState(() {});
  }

  // Función para realizar la multiplicación y actualizar la interfaz
  void _onMultiplicar() {
    _resultado = _multiplicar();
    _operacion = "*";
    setState(() {});
  }

  // Función para realizar la división y actualizar la interfaz
  void _onDividir() {
    _resultado = _dividir();
    _operacion = "/";
    setState(() {});
  }

  // Función para elevar al cuadrado el primer número y actualizar la interfaz
  void _elevarAlCuadrado() {
    _resultado = _primerNumero * _primerNumero;
    _operacion = "x²";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar la operación actual
            Text(
              'Operación: $_operacion',
              style: TextStyle(fontSize: 20),
            ),

            // Campos de entrada para los dos números
            TextField(
              decoration: InputDecoration(
                labelText: 'Primer número (x)',
              ),
              onChanged: (value) {
                _primerNumero = double.parse(value);
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Segundo número (y)',
              ),
              onChanged: (value) {
                _segundoNumero = double.parse(value);
              },
            ),

            // Botones para las operaciones matemáticas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _onSumar,
                  tooltip: 'Sumar',
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _onRestar,
                  tooltip: 'Restar',
                  child: Icon(Icons.remove),
                ),
              ],
            ),

            // Botones para otras operaciones matemáticas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _onMultiplicar,
                  tooltip: 'Multiplicar',
                  child: Icon(Icons.clear),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _onDividir,
                  tooltip: 'Dividir',
                  child: Text(
                    '÷',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(width: 10),

                // Botón para elevar al cuadrado
                FloatingActionButton(
                  onPressed: _elevarAlCuadrado,
                  tooltip: 'Elevar al cuadrado',
                  child: Text(
                    'x²',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),

            // Mostrar el resultado
            Text(
              'Resultado: $_resultado',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Calculadora(),
  ));
}

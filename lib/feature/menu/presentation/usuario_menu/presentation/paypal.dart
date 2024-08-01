import 'package:flutter/material.dart';

class PaypalPaymentView extends StatelessWidget {
  final int selectedAddressIndex;

  const PaypalPaymentView({Key? key, required this.selectedAddressIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago con PayPal'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.paypal, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Procesando pago con PayPal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Dirección seleccionada: $selectedAddressIndex'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para procesar el pago con PayPal
                // Por ahora, solo mostraremos un diálogo de éxito
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pago Exitoso'),
                      content: Text('Tu pago con PayPal ha sido procesado correctamente.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop(); // Volver a la pantalla anterior
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Pagar con PayPal',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
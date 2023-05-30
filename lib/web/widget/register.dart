import 'package:dafna_web/web/models/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String prefix = '';
  String hint = '+9989';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 50),
            child: Text(
              'Saytga kiring',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    registrField = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    registrField = true;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: 55,
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        prefix = '+9989';
                        hint = '';
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: prefix,
                      hintText: registrField == false ? hint : 'Telefon raqam kiriting',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.22,
                    55,
                  ),
                ),
                onPressed: () {},
                child: const Text('Kodni yuborish'),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

import 'package:dndmin/backend/register.dart';
import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final String topTag;
  final String insideTag;
  final bool obscured;
  final TextEditingController formKey;
  final Function validator;

  FormItem({
    @required this.topTag,
    @required this.insideTag,
    @required this.formKey,
    @required this.validator,
    this.obscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            topTag,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF707070)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10),
          child: TextFormField(
            controller: formKey,
            obscureText: obscured,
            validator: validator,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              hintText: insideTag,
              filled: true,
              fillColor: const Color(0xFFEFEFEF),
              hoverColor: const Color(0xFFEFEFEF),
              focusColor: const Color(0xFFEFEFEF),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final TextEditingController _usernameKey = TextEditingController();
final TextEditingController _mailKey = TextEditingController();
final TextEditingController _pwdKey = TextEditingController();
final TextEditingController _repPwdKey = TextEditingController();

class RegisterForm extends StatelessWidget {
  static final registerForm = GlobalKey<FormState>();

  static Future<String> register() async {
    String uInput = _usernameKey.text;
    String pwdInput = _pwdKey.text;
    String mailInput = _mailKey.text;
    return await Register.register(uInput, pwdInput, mailInput);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerForm,
      child: Column(
        children: [
          FormItem(
            formKey: _usernameKey,
            topTag: 'Nombre de Usuario',
            insideTag: 'Introduce tu Usuario',
            validator: (value) {
              if (value.toString().contains(RegExp(r'\W')))
                return 'Tu usuario no puede contener caracteres especiales';
              if (value.isEmpty) return 'Introduce tu nombre de usuario';
              return null;
            },
          ),
          FormItem(
            formKey: _mailKey,
            topTag: 'Correo',
            insideTag: 'Introduce tu Correo',
            validator: (value) {
              if (!value.toString().contains("@"))
                return 'Tu correo no es un correo valido';
              if (value.isEmpty) return 'Introduce tu correo';
              return null;
            },
          ),
          FormItem(
            formKey: _pwdKey,
            topTag: 'Contraseña',
            insideTag: 'Introduce tu contraseña',
            obscured: true,
            validator: (value) {
              print(value.toString().length);
              if (value.toString().length < 8)
                return 'Tu contraseña tiene que tener 8 caracteres o mas';
              if (value != _repPwdKey.value.text)
                return 'Las contraseñas no coinciden';
              if (value.isEmpty) return 'Introduce tu contraseña';

              return null;
            },
          ),
          FormItem(
            formKey: _repPwdKey,
            topTag: 'Repite tu Contraseña',
            insideTag: 'Introduce tu contraseña otra vez',
            obscured: true,
            validator: (value) {
              if (value.toString().length < 8)
                return 'Tu contraseña tiene que tener 8 caracteres o mas';
              if (value != _pwdKey.value.text)
                return 'Las contraseñas no coinciden';
              if (value.isEmpty) return 'Introduce tu contraseña';

              return null;
            },
          ),
        ],
      ),
    );
  }
}

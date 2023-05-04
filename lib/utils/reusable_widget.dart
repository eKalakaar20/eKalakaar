import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    //fit: BoxFit.fitWidth,
    //width: 240,
    height: 240,
    //color: Colors.white,
  );
}

const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
// const String mobilePattern =
//     r'^(\\+\\d{1,3}( )?)?((\\(\\d{3}\\))|\\d{3})[- .]?\\d{3}[- .]?\\d{4}$';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const String usernamePattern = r'^[A-Za-z][A-Za-z0-9_]{7,29}$';

late bool _passwordVisible;

TextFormField reusableTextField(String text, IconData icon, bool isPass,
    bool isUsername, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPass,
    enableSuggestions: !isPass,
    autocorrect: !isPass,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      suffixIcon: isPass ? SuffixIcon() : null,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType:
        isPass ? TextInputType.visiblePassword : TextInputType.emailAddress,
    validator: (value) {
      if (isPass) {
        if (value!.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      } else if (isUsername) {
        if (value!.isEmpty) {
          return 'Please fill Username field';
        } else if (!RegExp(usernamePattern).hasMatch(value)) {
          return 'Please enter a valid Username with more than 8 chars';
        }
      } else {
        if (value!.isEmpty) {
          return 'Please fill email/phone number field';
        } else if (!RegExp(mobilePattern).hasMatch(value) &&
            !RegExp(emailPattern).hasMatch(value)) {
          return 'Please enter a valid email/phone number';
        }
        return null;
      }
    },
  );
}

Container DefaultButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}

class SuffixIcon extends StatefulWidget {
  const SuffixIcon({super.key});

  @override
  State<SuffixIcon> createState() => _SuffixIconState();
}

class _SuffixIconState extends State<SuffixIcon> {
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      icon: Icon(
        _passwordVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_off_outlined,
      ),
      iconSize: 20,
    );
  }
}
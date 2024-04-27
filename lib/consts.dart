import "package:flutter/material.dart";

// const bg_old = Color(0xffb9eb9b);
const fg_old = Color(0xff1a2226);
const ac = Color.fromARGB(233, 25, 173, 70);
// const bg = Color(0xff133A0D);
const bg = Color(0xff3C7962);
const fg = Colors.white;
const dm = Color(0xffC0D8D0);
var r =
    MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4.0),
));
// const ac = Color.fromARGB(255, 90, 163, 127);
var ebs = ButtonStyle(
    maximumSize: const MaterialStatePropertyAll<Size>(Size(180, 180)),
    backgroundColor: const MaterialStatePropertyAll<Color>(bg),
    foregroundColor: const MaterialStatePropertyAll<Color>(fg),
    shape: r);
const head = TextStyle(fontSize: 36, color: bg);
const sch = TextStyle(fontSize: 50, color: bg);
const fs = TextStyle(color: bg);
var td = ThemeData(fontFamily: 'Poppins');
const btn = Color(0xff77BBA2);
InputDecoration fd(String x) {
  return InputDecoration(
    filled: true,
    fillColor: btn,
    hintText: x,
    hintStyle: TextStyle(color: bg, fontSize: 18),
    focusColor: bg,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: btn),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: btn),
    ),
  );
}

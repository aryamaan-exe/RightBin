import "package:flutter/material.dart";

const bg_old = Color(0xffb9eb9b);
const fg_old = Color(0xff1a2226);
const ac = Color.fromARGB(233, 44, 15, 1);
const bg = Color(0xff133A0D);
const fg = Colors.white;
const dm = Colors.black;
var r =
    MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4.0),
));
// const ac = Color.fromARGB(255, 90, 163, 127);
var ebs = ButtonStyle(
    maximumSize: MaterialStatePropertyAll<Size>(Size(175, 175)),
    backgroundColor: const MaterialStatePropertyAll<Color>(bg),
    foregroundColor: const MaterialStatePropertyAll<Color>(fg),
    shape: r);
var ebs2 = ButtonStyle(
    maximumSize: MaterialStatePropertyAll<Size>(Size(128, 48)),
    backgroundColor: const MaterialStatePropertyAll<Color>(bg),
    foregroundColor: const MaterialStatePropertyAll<Color>(fg),
    shape: r);
const head = TextStyle(fontSize: 36, color: fg);
const sch = TextStyle(fontSize: 50, color: fg);
const fs = TextStyle(color: fg);
InputDecoration fd(String x) {
  return InputDecoration(
    label: Text(x),
    focusColor: bg,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: fg),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: bg),
    ),
  );
}

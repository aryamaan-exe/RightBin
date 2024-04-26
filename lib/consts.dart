import "package:flutter/material.dart";

const bg_old = Color(0xffb9eb9b);
const fg_old = Color(0xff1a2226);
const ac = Color.fromARGB(233, 25, 173, 70);
// const bg = Color(0xff133A0D);
const bg = Color(0xff3C7962);
const fg = Colors.white;
const dm = Colors.black;
var r =
    MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4.0),
));
// const ac = Color.fromARGB(255, 90, 163, 127);
var ebs = ButtonStyle(
    maximumSize: const MaterialStatePropertyAll<Size>(Size(175, 175)),
    backgroundColor: const MaterialStatePropertyAll<Color>(bg),
    foregroundColor: const MaterialStatePropertyAll<Color>(fg),
    shape: r);
var ebs2 = ButtonStyle(
    maximumSize: const MaterialStatePropertyAll<Size>(Size(128, 48)),
    backgroundColor: const MaterialStatePropertyAll<Color>(bg),
    foregroundColor: const MaterialStatePropertyAll<Color>(fg),
    shape: r);
const head = TextStyle(fontSize: 36, color: fg);
const sch = TextStyle(fontSize: 50, color: fg);
const fs = TextStyle(color: fg);
InputDecoration fd(String x) {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xff77BBA2),
    label: Text(x),
    focusColor: bg,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: fg),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: bg),
    ),
  );
}

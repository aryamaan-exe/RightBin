import "package:flutter/material.dart";

const bg = Color(0xffb9eb9b);
const fg = Color(0xff1a2226);
const ac = Color(0xff307351);
const ebs = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll<Color>(bg),
  foregroundColor: MaterialStatePropertyAll<Color>(fg),
);
const head = TextStyle(fontSize: 24);
const fs = TextStyle(color: fg);
const fd = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: fg),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: bg),
  ),
);

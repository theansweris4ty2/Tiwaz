import std/osproc

var err = osproc.execCmd("odin build . -out:Tiwaz.exe -o:speed")

if err > 0 
import std/osproc

var err = osproc.execCMD("odin build . -out:Tiwaz.exe -o:speed")

if err > 
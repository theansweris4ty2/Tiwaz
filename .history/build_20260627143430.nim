import std/osproc

var err = osproc.execCmdE("odin build . -out:Tiwaz.exe -o:speed")

if err > 0 
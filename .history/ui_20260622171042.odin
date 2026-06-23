package Tiwaz
import k2 "vendor:karl2d"

Button :: struct {
    rect: k2.Rect,
    color: k2.Color,
    label: string,
}


buttons2: [dynamic; 5]Button



Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button
}

build_ui::proc(){
main_menu:= Menu{{1350, 700, 400, 400}, {}}


p
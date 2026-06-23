package Tiwaz
import k2 "vendor:karl2d"

Button :: struct {
    rect: k2.Rect,
    color: k2.Color,
    label: string,
}


Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button
}


main_menu:= Menu{{1350, 700, 400, 400}, {}}

create_ui ::proc() -> (first: [dynamic; 5]Button, buttons2: [dynamic; 5]Button) {
    button1: Button = {{f32(100), f32(800), f32(100), f32(60)}, k2.RED, "ROLL"}
    buttons1:[dynamic; 5]Button
    buttons2: [dynamic; 5]Button
    append(&buttons1, button1)
    return buttons1, buttons2
}

package Tiwaz
import k2 "vendor:karl2d"

Button :: struct {
    rect: k2.Rect,
    color: k2.Color,
    label: string,
}


Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button,
    label: string
}


main_menu:= Menu{{1370, 650, 420, 500}, buttons{Button{f32(1420) f32(450), f32(100), f32(60)}, k2.RED, "Action"}, "Player Menu"}

dice_files := [6]string{"assets/pipone.png", "assets/piptwo.png", "assets/pipthree.png", "assets/pipfour.png", "assets/pipfive.png", "assets/pipsix.png"}

create_ui ::proc() -> (first_buttons: [dynamic; 5]Button, second_buttons: [dynamic; 5]Button) {
    button1: Button = {{f32(100), f32(800), f32(100), f32(60)}, k2.RED, "ROLL"}
    buttons1:[dynamic; 5]Button
    buttons2: [dynamic; 5]Button
    append(&buttons1, button1)
    return buttons1, buttons2
}

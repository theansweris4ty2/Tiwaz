package Tiwaz
import k2 "vendor:karl2d"

Button :: struct {
    rect: k2.Rect,
    color: k2.Color,
    label: string,
}

button1: Button = {{f32(100), f32(800), f32(100), f32(60)}, k2.RED, "ROLL"}
buttons: [dynamic; 5]Button
buttons2: [dynamic; 5]Button
button2: Button = {{f32(1400), f32(750), f32(100), f32(60)}, k2.RED, "ACTION"}


Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button
}odin

// Placeholder for mockup of menu to test UI layout options
main_menu:= Menu{{1350, 700, 400, 400}, buttons2}
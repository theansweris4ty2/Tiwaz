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



Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button
}

build_ui::proc(){}
main_menu:= Menu{{1350, 700, 400, 400}, {}}
dice_files :=[6]string{"assets/pip1.png", "assets/pip2.png", "assets/pip3.png", "assets/pip4.png", "assets/pip5.png", "assets/pip6.png"}
dice_images := load_game_textures(dice_files)
dice1_index: i32
dice2_index: i32
dice3_index: i32

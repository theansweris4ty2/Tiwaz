package Tiwaz
import "core:fmt"
import k2 "vendor:karl2d"

Button :: struct {
    rect: k2.Rect,
    color: k2.Color,
    label: string,
}


Menu :: struct {
    rect: k2.Rect,
    buttons: [dynamic; 5]Button,
    border: f32,
    label: string
}




dice_files := [6]string{"assets/pipone.png", "assets/piptwo.png", "assets/pipthree.png", "assets/pipfour.png", "assets/pipfive.png", "assets/pipsix.png"}

create_ui ::proc() -> (first_buttons: [dynamic; 5]Button, main: Menu) {
    button1: Button = {{f32(100), f32(800), f32(100), f32(60)}, k2.RED, "ROLL"}
    buttons1:[dynamic; 5]Button
    buttons2: [dynamic; 5]Button
    append(&buttons1, button1)
    main_menu: Menu = {{1370, 650, 420, 500}, buttons2, 10, "Player Menu"}
    main_menu_button1:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 100, 100, 50}, k2.RED, "Action"}
    main_menu_button2:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 150, 100, 50}, k2.RED, "Action"}
    main_menu_button3:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 200, 100, 50}, k2.RED, "Action"}
    action_button1:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 100, 100, 50}, k2.RED, "Action"}
    main_menu_button2:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 150, 100, 50}, k2.RED, "Action"}
    action_button3:= Button{{main_menu.rect.x + 300, main_menu.rect.y + 200, 100, 50}, k2.RED, "Action"}
    append(&main_menu.buttons, main_menu_button1)
    append(&main_menu.buttons, main_menu_button2)
    append(&main_menu.buttons, main_menu_button3)
    append(&main_menu.buttons, action_button1)
    append(&main_menu.buttons, main_menu_button2)
    append(&main_menu.buttons, main_menu_button3)
    return buttons1, main_menu
}

draw_ui ::proc(menu: Menu, buttons: [dynamic; 5]Button, index1: i32, index2: i32, index3: i32, action1: i32, action2: i32, action3: i32){
    
    for button in menu.buttons {
    
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 30, k2.BLACK)
      k2.draw_rect_outline(button.rect, 1, k2.BLACK)
     }
     for button in buttons {
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 40, k2.BLACK)
     }
    dice_images := load_game_textures(dice_files)
    k2.draw_texture(dice_images[index1], {0, 700})
    k2.draw_texture(dice_images[index2], {100, 700})
    k2.draw_texture(dice_images[index3], {200, 700})
    k2.draw_rect_outline(menu.rect, menu.border, k2.BLACK)
    k2.draw_text(menu.label, {menu.rect.x + 10, menu.rect.y + 10}, 70, k2.BLACK)
    k2.draw_text(fmt.tprintf("Action 1: {}", action1), {menu.rect.x + 50, menu.rect.y + 100}, 50, k2.BLACK)
    k2.draw_text(fmt.tprintf("Action 2: {}", action2), {menu.rect.x + 50, menu.rect.y + 150}, 50, k2.BLACK)
    k2.draw_text(fmt.tprintf("Action 3: {}", action3), {menu.rect.x + 50, menu.rect.y + 200}, 50, k2.BLACK)

}

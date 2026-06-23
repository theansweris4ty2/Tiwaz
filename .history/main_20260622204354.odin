package Tiwaz
import "core:fmt"
import "vendor:karl2d/examples/mouse"
import "core:math/rand"
import "core:os"
import "core:strconv"
import "core:time"
import k2 "vendor:karl2d"

SCREEN_WIDTH :: 1200
SCREEN_HEIGHT :: 900



main::proc() {
player := Player{}
buttons1, main_menu := create_ui()
main_menu_button:= Button{{main_menu.rect.x + , main_menu.rect.y + 10, 100, 60}, k2.RED, "Action"}
append(&main_menu.buttons, main_menu_button)
k2.init(SCREEN_WIDTH, SCREEN_HEIGHT, "Tiwaz", {})
tiles := build_board()
defer delete(tiles)
dice_images := load_game_textures(dice_files)
dice1_index: i32
dice2_index: i32
dice3_index: i32


dice_sound := k2.load_sound_from_file("assets/dice.wav")
rolled: bool

for k2.update() {
k2.clear(k2.LIGHT_BROWN)


point := k2.get_mouse_position()
if k2.mouse_button_went_down(.Left) {
    for &tile in tiles {
        if check_collisions(tile.rect, point) && player.action_points1 > 0{
            if player.action_points1 > 0 {
                player.action_points1 -= 1
            } 
            else {
                continue
            }
        }
    }

    for button in buttons1 {
        if check_collisions(button.rect, point){
            dice1_index, dice2_index, dice3_index = roll_dice() 
            player.action_points1 = dice1_index + 1
            player.action_points2 = dice2_index + 1
            player.action_points3 = dice3_index + 1

        }
    }
}

if k2.mouse_button_is_held(.Right) {
    for tile in tiles {
        if check_collisions(tile.rect, point){
            k2.draw_text(tile.kind, {f32(50), f32(300)}, 40, k2.BLACK)
            k2.draw_text(fmt.tprintf("{}", tile.production_value), {f32(60), f32(350)}, 40, k2.BLACK)
            
        }
    }
}

for tile in tiles {
    k2.draw_texture(tile.texture, {tile.rect.x, tile.rect.y})
    k2.draw_rect_outline(tile.rect, 1, k2.BLACK)
}

x: f32 = 0
y: f32 = 700


    
    k2.draw_texture(dice_images[dice1_index], {x, y})
    x += f32(100)
     k2.draw_texture(dice_images[dice2_index], {x, y})
    x += f32(100)
     k2.draw_texture(dice_images[dice3_index], {x, y})
     y+= f32(100)
     for button in buttons1 {
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 40, k2.BLACK)
     }
     for button in main_menu.buttons {
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 40, k2.BLACK)
     }
    
     k2.draw_rect_outline(main_menu.rect, 5, k2.BLACK)
     k2.draw_text(main_menu.label, {main_menu.rect.x + 10, main_menu.rect.y + 10}, 70, k2.BLACK)
     k2.draw_text(fmt.tprintf("Action 1: {}", player.action_points1), {main_menu.rect.x + 50, main_menu.rect.y + 100}, 50, k2.BLACK)
      k2.draw_text(fmt.tprintf("Action 2: {}", player.action_points2), {main_menu.rect.x + 50, main_menu.rect.y + 150}, 50, k2.BLACK)
       k2.draw_text(fmt.tprintf("Action 3: {}", player.action_points3), {main_menu.rect.x + 50, main_menu.rect.y + 200}, 50, k2.BLACK)
    
    
k2.present()
}
k2.shutdown()
}


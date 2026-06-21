package Tiwaz
import "core:fmt"
import "vendor:karl2d/examples/mouse"
import "core:math/rand"
import "core:os"
import "core:time"
import k2 "vendor:karl2d"

SCREEN_WIDTH :: 1200
SCREEN_HEIGHT :: 900



main::proc() {
player := Player{}
append(&buttons, button1)
append(&buttons2, button2)
k2.init(SCREEN_WIDTH, SCREEN_HEIGHT, "Tiwaz", {})
tiles := build_board()
defer delete(tiles)
dice_files :=[6]string{"assets/pip1.png", "assets/pip2.png", "assets/pip3.png", "assets/pip4.png", "assets/pip5.png", "assets/pip6.png"}
dice_images := load_game_textures(dice_files)
dice1_index: i32
dice2_index: i32
dice3_index: i32
dice_sound := k2.load_sound_from_file("assets/dice.wav")
rolled: bool

for k2.update() {
k2.clear(k2.WHITE)


point := k2.get_mouse_position()
if k2.mouse_button_went_down(.Left) {
    for &tile in tiles {
        if check_collisions(tile.rect, point) && player.action_points1 > 0{
            tile.color = k2.RED
            // k2.draw_text(tile.kind, {f32(50), f32(300)}, 40, k2.BLACK)
            if player.action_points1 > 0 {
                player.action_points1 -= 1
            } 
            else {
                continue
            }
        }
    }
if k2.mouse_button_is_held(.Right) {
    for &tile in tiles {
        if check_collisions(tile.rect, point) && player.action_points1 > 0{
            k2.draw_text(tile.kind, {f32(50), f32(300)}, 40, k2.BLACK)

        }
    }
    for button in buttons {
        if check_collisions(button.rect, point){
            dice1_index, dice2_index, dice3_index = roll_dice() 
            player.action_points1 = dice1_index + 1
            player.action_points2 = dice2_index + 1
            player.action_points3 = dice3_index + 1

        }
    }
}
for tile in tiles {
    k2.draw_rect_outline(tile.rect, 5.0, tile.color)
}

x: f32 = 0
y: f32 = 700


    
    k2.draw_texture(dice_images[dice1_index], {x, y})
    x += f32(100)
     k2.draw_texture(dice_images[dice2_index], {x, y})
    x += f32(100)
     k2.draw_texture(dice_images[dice3_index], {x, y})
     y+= f32(100)
     for button in buttons {
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 40, k2.BLACK)
     }
     for button in buttons2 {
     k2.draw_rect({button.rect.x, button.rect.y, button.rect.w, button.rect.h}, button.color)
     k2.draw_text(button.label, {button.rect.x + 10, button.rect.y + 10}, 40, k2.BLACK)
     }
     k2.draw_rect_outline(main_menu.rect, 5, k2.BLACK)
    
    
k2.present()
}
k2.shutdown()
}


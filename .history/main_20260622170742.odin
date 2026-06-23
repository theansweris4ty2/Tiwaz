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
k2.init(SCREEN_WIDTH, SCREEN_HEIGHT, "Tiwaz", {})
tiles := build_board()
defer delete(tiles)



dice_sound := k2.load_sound_from_file("assets/dice.wav")
rolled: bool

for k2.update() {
k2.clear(k2.LIGHT_BROWN)




for tile in tiles {
    k2.draw_texture(tile.texture, {tile.rect.x, tile.rect.y})
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
     k2.draw_text(fmt.tprintf("Action 1: {}", player.action_points1), {main_menu.rect.x + 50, main_menu.rect.y + 100}, 50, k2.BLACK)
      k2.draw_text(fmt.tprintf("Action 2: {}", player.action_points2), {main_menu.rect.x + 50, main_menu.rect.y + 150}, 50, k2.BLACK)
       k2.draw_text(fmt.tprintf("Action 3: {}", player.action_points3), {main_menu.rect.x + 50, main_menu.rect.y + 200}, 50, k2.BLACK)
    
    
k2.present()
}
k2.shutdown()
}


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
player_ptr: ^Player = &player
buttons1, main_menu, stats_menu := create_ui()
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
// draw_board(tiles)
// draw_ui(main_menu, buttons1, dice1_index, dice2_index, dice3_index, player.action_points1, player.action_points2, player.action_points3, stats_menu, player)

// point := k2.get_mouse_position()
// if k2.mouse_button_went_down(.Left) {
//     for &tile in tiles {
//         if check_collisions(tile.rect, point){
//             if player.action_points1 > 0 && !tile.harvested{
//                 player_ptr.action_points1 -= 1
//                 tile.occupied = true
//                 produce(tile, player_ptr)
//                 tile.harvested = true   
                
//             } 
//             else if player.action_points2 > 0 && !tile.harvested{
//                 player_ptr.action_points2 -= 1
//                 tile.occupied = true
//                 produce(tile, player_ptr)
//                 tile.harvested = true
//             }
//             else if player.action_points3 > 0 && !tile.harvested{
//                 player_ptr.action_points3 -= 1
//                 tile.occupied = true
//                 produce(tile, player_ptr)
//                 tile.harvested = true   

//             }

//         }
//     }

//     for button in buttons1 {
//         if check_collisions(button.rect, point) && player.action_points1 == 0 && player.action_points2 == 0 && player.action_points3 == 0{
//             dice1_index, dice2_index, dice3_index = roll_dice() 
//             player.action_points1 = dice1_index + 1
//             player.action_points2 = dice2_index + 1
//             player.action_points3 = dice3_index + 1
//             for &tile in tiles {
//             tile.harvested = false
//             tile.occupied = false
//         }

//         }
//     }
// }

// if k2.mouse_button_is_held(.Right) {
//     for tile in tiles {
//         if check_collisions(tile.rect, point){
//             k2.draw_text(tile.kind, {f32(50), f32(300)}, 40, k2.BLACK)
//             k2.draw_text(fmt.tprintf("{}", tile.production_value), {f32(60), f32(350)}, 40, k2.BLACK)
            
//         }
//     }
// }

player_action(tiles, player_ptr, buttons1)

    draw_board(tiles)
    draw_ui(main_menu, buttons1, dice1_index, dice2_index, dice3_index, player.action_points1, player.action_points2, player.action_points3, stats_menu, player)
    
    
    
    
k2.present()
}
k2.shutdown()
fmt.printf("crops: %d, ore: %d, lumber: %d, troops: %d", player.crops, player.ore, player.lumber, player.troops)
}


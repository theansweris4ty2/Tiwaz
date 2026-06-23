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

    for button in buttons {
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
}
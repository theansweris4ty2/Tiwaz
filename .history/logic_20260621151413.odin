package Tiwaz
import "core:fmt"
import "core:math/rand"
import k2 "vendor:karl2d"


// Placeholder proc to test whether having proc associated with tiles works
turn_red :: proc(tile: ^Tile){
    tile.color = k2.RED
}

// TODO add logic for building UI either in the build_board proc or as a separate proc. 
build_board :: proc() -> [dynamic]Tile{
    tiles : [dynamic]Tile
    for tile in tiles {
        tile.production_value = rand.int32_range
        tile_variant := rand.int32_range(0,3)
        switch tile_variant 
    }
    start_y: f32 = 500
    start_x: f32 = 300
    x: f32
    y: f32
    for i in 0..=4{
        x = f32(i*100) + 350
        for h in 0..=i {
            y = f32(h*100) + start_y
            append(&tiles, Tile{k2.Rect{x, y, 100, 100}, k2.BLACK})
        }
        start_y -= 50
        start_x += 50
    }
    start_y = 250
    columns: int = 5
    for i in 0..=5{
        x = f32(i*100) + f32(850) 
        for h in 0..=columns{
            y = f32(h*100) + start_y
            append(&tiles, Tile{k2.Rect{x, y, 100, 100}, k2.BLACK})
        }
        start_y += 50
        columns -= 1   
    }
    return tiles
}

check_collisions :: proc(rect: k2.Rect, point: Vec2)-> bool{
        collided: bool
        if point.x  > rect.x && point.x  < rect.x + rect.w && point.y > rect.y && point.y  < rect.y + rect.h {
            collided = true
        }
        else {
            collided = false
        }
        return collided
    }
    
load_game_textures ::proc(dice: [6]string) -> [dynamic; 6]k2.Texture{
    dice_images: [dynamic; 6]k2.Texture
    for string in dice {
        image := k2.load_texture_from_file(string, {})
        append(&dice_images, image)
    }
    return dice_images
}

roll_dice :: proc() -> (i32, i32, i32){
    roll1:= rand.int32_range(0,5) 
    roll2 := rand.int32_range(0,5) 
    roll3 := rand.int32_range(0,5) 

    return roll1, roll2, roll3
}
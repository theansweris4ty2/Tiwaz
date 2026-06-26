package Tiwaz
import k2 "vendor:karl2d"

Tile :: struct {
    kind: string,
    rect: k2.Rect,
    product: string,
    production_value: i32,
    texture: k2.Texture,
    occupied: bool
    

}
// Tile_Variant :: union {

// }

Vec2 :: [2]f32

Player :: struct {
    score: i32,
    controlled_tiles: [dynamic]^Tile,
    action_points1: i32,
    action_points2: i32,
    action_points3: i32,
    
}


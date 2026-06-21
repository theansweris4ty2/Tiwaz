package Tiwaz
import k2 "vendor:karl2d"

Tile :: struct {
    rect: k2.Rect,
    color: k2.Color,
    action: proc(^Tile),
}

Vec2 :: [2]f32

Player :: struct {
    score: i32,
    controlled_tiles: [dynamic]^Tile,
    action_points1: i32,
    


}
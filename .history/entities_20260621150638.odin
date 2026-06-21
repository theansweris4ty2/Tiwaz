package Tiwaz
import k2 "vendor:karl2d"

Tile :: struct {
    rect: k2.Rect,
    color: k2.Color,
    // image: k2.Texture
}
Tile_Variant :: union {

}

Vec2 :: [2]f32

Player :: struct {
    score: i32,
    controlled_tiles: [dynamic]^Tile,
    action_points1: i32,
    action_points2: i32,
    action_points3: i32,
}

Farm_Tile :: struct {
    title: string,
    produc: string

}
Woods_Tile :: struct {}
Mining_Tile :: struct {}
Military_Tile :: struct {}

Products :: enum {
    "Wheat"
}
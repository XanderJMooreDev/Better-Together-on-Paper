effect_create_layer("Effects", ef_explosion, x + 8, y + 8, 12, color);

image_xscale = 3;
image_yscale = 3;
x -= 280;
y -= 100;
visible = false;

sprite_index = spr_collision;
alarm[1] = 10;

layer_set_visible("Screenshake", true);
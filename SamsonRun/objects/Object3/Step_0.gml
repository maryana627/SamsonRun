var cam_x = camera_get_view_x(view_camera[0]);

layer_x("sky", cam_x * 0.95);
layer_x("cloud", cam_x * 0.95);
layer_x("mountains", cam_x * 0.95);
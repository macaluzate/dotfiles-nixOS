{
  enable = true;
  
  font = {
    name = "JetBrains Mono";
    size = 13;
  };
  
  settings = {
    # Fondo con imagen
    #background_image = "/home/tompi4/Pictures/pot.jpg";
    background_image_layout = "scaled";
    background_image_linear = false;
    background_opacity = "0.85";
    background = "#000000";
    
    # Configuraciones adicionales que puedes agregar
    cursor_shape = "block";
    cursor_blink_interval = 0;
    
    # Colores del terminal (opcional)
    foreground = "#ffffff";
    
    # Configuración de ventana
    window_padding_width = 10;
    
    # Configuración de tabs (opcional)
    tab_bar_edge = "bottom";
    tab_bar_style = "powerline";
  };
  
  # Keybindings personalizados (opcional)
  keybindings = {
    "ctrl+shift+c" = "copy_to_clipboard";
    "ctrl+shift+v" = "paste_from_clipboard";
    "ctrl+shift+t" = "new_tab";
    "ctrl+shift+w" = "close_tab";
  };
}

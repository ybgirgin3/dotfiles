-- WezTerm konfigürasyon dosyası

local wezterm = require 'wezterm'

return {
  -- Font ayarları
  -- font = wezterm.font("Liga SFMono Nerd Font"),
  -- font = wezterm.font("Hack Nerd Font Mono"),
  font = wezterm.font("MesloLGM Nerd Font Mono"),
  font_size = 12.0, -- Burada font boyutunu ihtiyacınıza göre ayarlayabilirsiniz

  -- Şeffaflık ayarları
  enable_wayland = false, -- Eğer Wayland kullanıyorsanız bunu true yapın
  window_background_opacity = 0.8, -- Pencerede arka plan şeffaflığını ayarlar. 1.0 tamamen opak, 0.0 tamamen şeffaf

  -- Arka plan bulanıklaştırma ayarları
  -- use_fancy_tab_bar = false, -- Eğer tab çubuğunda bulanıklık istiyorsanız bunu true yapın
  -- enable_ime = true, -- Input method editor (IME) kullanımını etkinleştirir
}


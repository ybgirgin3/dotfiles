# install the fonts
cp -r emojione-android.ttf NotoColorEmoji.ttf ~/.local/share/fonts

# run the command
fc-cache -v -f

echo "if you saw “fc-cache: succeeded” message it's done"

# install emoji picker from snap
yay -S emote


echo "Do not forget to change Ctrl+Alt+e -> Super + ."


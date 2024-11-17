import os 
import random

files=os.listdir("/home/pixel/.config/wallpaper/")
index= random.randint(1,len(files)-1)
os.system(f"feh --bg-fill ~/.config/wallpaper/{files[index]}")

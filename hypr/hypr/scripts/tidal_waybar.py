#!/usr/bin/env python3
import json, requests, html, os

TRIM_DIM = 25
ICON_PATH = "/tmp/_tidal_img.jpg"

def generate_error(error):
    return f"<b>error: </b><span color='red'>{error}</span>"

def print_data(text :str, tooltip :str):
    data = {
        "text" : text,
        "tooltip" : tooltip
    }
    print(json.dumps(data))

try:
    # load data
    response_data = requests.get('http://127.0.0.1:47836/current')
    response_data.raise_for_status()

    data = json.loads(response_data.content.decode())

    # load img
    response_img = requests.get('http://127.0.0.1:47836/current/image')
    response_img.raise_for_status()

    with open(ICON_PATH, "wb") as file:
        file.write(response_img.content)

    dots = False
    if(len(data["title"]) > TRIM_DIM):
        dots = True

    title = data["title"][:TRIM_DIM]
    print_data(
        html.escape(title) + ('…' if dots else ''), 
        f" <span size='large'>{html.escape(data["title"])}</span> \n <span color='#b8b8b8'><small>{html.escape(data["artists"])}</small></span> "
    )

except:
    if os.path.exists(ICON_PATH):
        os.remove(ICON_PATH)
    print_data('','')
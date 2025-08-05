#!/bin/bash

# instagram
yt-dlp -f "best[ext=mp4]" 'https://www.instagram.com/wiffenthoughts/reel/DG9kFABxnfi/'

# youtube
yt-dlp -f "best[height<=1080]" --get-url --cookies-from-browser edge 'https://www.youtube.com/watch?v=CqeUqpl5mgs&ab_channel=%E9%B8%AD%E9%B8%AD%E6%98%AF%E6%97%B6%E5%80%99%E5%8F%91%E8%B4%A2%E4%BA%86TravelWithYaYa'

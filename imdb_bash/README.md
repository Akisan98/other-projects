# IMDB Bash Script

This is a bash script for retrieving the best / scrapest image from a series / movie IMDB page. All you need to do is to type in the IMDB page-url and then the Script will find the information and display it on the screen as well as saving it to a .txt by default, named output.txt.

<br>

When you start the script you will be greeted by a menu, here you will have some options like modes, toggling writing to file and at last the exit/quit command. This menu is self explanatory, note that if you enter in the "multi"-mode, if you type quit if will bring to the menu screen, where you can type quit again to close the script or chose another mode or something.

## A bit of backstory:
This all started with the Binge app. In beginning all the data of the Binge app was locally stored, I didn’t have a server or any outgoing connections. This meant that all the series a user is watching or wanted to watch must be bundled with app in a database. This was a time demanding task of looking up the IMDb pages and copying relevant information, the hardest part was to get the highest resolution image of the poster, as most of the time IMDb serve a downsized or cropped image. As a normal user you have to click though 2 or more subpages of the series to reach it. At the same time, we learn briefly about web scraping and how it can pull information we want regardless if the provider has an API. I used this to make a one-line script that would fetch me the highest resolution image for the selected series by providing the URL for the IMDb page. And this Bash script is based on that one-line script. After a while I realized that I watch or have watched way too many series to go on this way. So, I started to expand the usage of web scraping by building it into the app. And as time when on I expanded it to fetch more and more data like, runtime, number of seasons, episodes per season and so on.

<br><br>


<br>

This script as well as this oneliner:

```bash
curl -s [LINK] | grep ".jpg" | head -n 3 | grep '"image":' | cut -d'"' -f4
```

```bash
curl -s https://www.imdb.com/title/tt7414406/?ref_=nv_sr_srsg_0 | grep ".jpg" | head -n 3 | grep '"image":' | cut -d'"' -f4
```

Which was the original, are intended to run on Linux (UiO Linux Server), but the  git bash terminal in Windows does also work.


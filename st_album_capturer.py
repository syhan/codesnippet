#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
This tiny python script is simply used for capture
songs and download them from http://www.songtaste.com
author: syhan (syhannnn@gmail.com)
'''

import re
import urllib, urllib2
import sys, os, pwd
import subprocess

opener = urllib2.build_opener()
tries = 20

# the get_song_type is obtained from http://image.songtaste.com/inc/main.js
# from line 105 to 128
def get_song_type(type):
    return {
        '7d99bb4c7bd4602c342e2bb826ee8777':'.wma',
        '25e4f07f5123910814d9b8f3958385ba':'.Wma',
        '51bbd020689d1ce1c845a484995c0cce':'.WMA',
        'b3a7a4e64bcd8aabe4cabe0e55b57af5':'.mp3',
        'd82029f73bcaf052be8930f6f4247184':'.MP3',
        '5fd91d90d9618feca4740ac1f2e7948f':'.Mp3'
    }[type]
 

def get_song_url(html_src):
    info = re.search("javascript:playmedia1\('\w+','\w+', '(.+?)', '\d+', '\d+', '([\w\d]+)', '(.+?)'\);", html_src)
    song_url = info.group(3) + info.group(1) + get_song_type(info.group(2))
    return song_url

def download_url(url, dest_file):
    try:
        cmd = 'wget -t %d %s -O \'%s\'' % (tries, url, dest_file)
        p = subprocess.Popen(cmd, shell=True)
        sts = os.waitpid(p.pid, 0)
    except OSError, reason:
        print 'error occurs %s, skipping...' % reason
        pass

def capture_album(album_url, dest_folder='.'):
    try:
        html_src = opener.open(album_url).read().decode('gbk')
    except urllib2.URLError, reason:
        print reason
        sys.exit(-1)

    songs_info = re.findall('WS\("\d+","(\d+?)","(.+?)","(.+?)"\);', html_src)
    album_name = re.search('<p class="mid_tit">(.+)<p>', html_src).group(1)
    album_icon_url = re.search("<img src='(http://image.songtaste.com/images/abu/\w+.\w+)' border=0 class='icon'>", html_src).group(1)
    folder = os.path.join(dest_folder, album_name)

    print 'Creating %s...' % folder

    try:
        os.mkdir(folder)
    except OSError, reason:
        print reason
        sys.exit(-1)

    download_url(album_icon_url, os.path.join(folder, 'cover.gif'))

    for info in songs_info:
        song_url_info = 'http://www.songtaste.com/song/%s/' % info[0]
        url = get_song_url(opener.open(song_url_info).read())
        print 'Downloading %s... ' % info[1]
        # it's a little bit ugly by fetching the extention name from the last characters
        download_url(url, os.path.join(folder, info[1].rstrip() + url[-4:]))

if __name__ == '__main__':
    if len(sys.argv) >= 2:
        capture_album(sys.argv[1])
    else:
        print '%s: missing URL' % sys.argv[0]
        print __doc__
        print 'Usage: python %s [URL]' % sys.argv[0]
        sys.exit(-1)

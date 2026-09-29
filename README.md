# Video/Audio Transcript Player

## Using Transcripts From Youtube

A recent yt-dlp, usually you should be able to install it via pip install
yt-dlp it may be available later as \~/.local/bin/yt-dlp. My local yt-dlp
always claims that it needs a proper javascript interpreter for handling
youtube, but until recently it still worked without.

xsltproc is part of libxslt and was available on most Linux distros I’ve used so far

# A video that has only automatic transcripts

A German video with auto transcript

```
yt-dlp --skip-download 'https://www.youtube.com/watch?v=$VIDEO_ID' --list-subs
...
ka       Georgian              vtt, srt, ttml, srv3, srv2, srv1, json3
de-orig  German (Original)     vtt, srt, ttml, srv3, srv2, srv1, json3
de       German                vtt, srt, ttml, srv3, srv2, srv1, json3
...
... has no subtitles
```

ttml is actually a quite nice format

```
yt-dlp --skip-download 'https://www.youtube.com/watch?v=$VIDEO_ID' --write-auto-subs --sub-format ttml --sub-langs de-orig -o out
\[youtube\] VIDEO_ID   : Downloading visionos player API JSON
\[youtube\] VIDEO_ID   : Downloading m3u8 information
\[info\] VIDEO_ID   : Downloading subtitles: de-orig
\[info\] VIDEO_ID   : Downloading 1 format(s): 616+251
\[info\] Writing video subtitles to: out.de-orig.ttml
WARNING: The extractor specified to use impersonation for this download, but no impersonate target is available. If you encounter errors, then see  https://github.com/yt-dlp/yt-dlp\#impersonation  for information on installing the required dependencies
\[download\] Destination: out.de-orig.ttml
\[download\] 100% of  387.00KiB in 00:00:00 at 1.53MiB/s
```

```
xsltproc ttml2text.xslt out.de-orig.ttml
00:00:00.120: Hier steht der Text des Transkripts.
00:00:01.880: Egal wie lang er ist, alles erscheint hier.
...
```

## Using Youtube Embedded Player

You can use ttml2html-yt.xslt, but you have to serve it via http:// not via
file://. Unfortunately, the embedded player supports only integer start times,
so the synchronization is quite coarse

```
xsltproc --stringparam VideoID $VIDEO_ID ttml2html-yt.xslt out.de-orig.ttml > index.html
python -m http.server
```


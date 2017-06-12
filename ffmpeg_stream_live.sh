ffmpeg -y -headers "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7^M\012Accept-Language: en-us,en;q=0.5^M\012Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8^M\012User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20150101 Firefox/47.0 (Chrome)^M\012" \
      -i $(youtube-dl https://youtu.be/liEbIbGJRO8 --get-url) \
      -ss 00:00:01.500 -f image2 -vframes 1 thumb.jpg

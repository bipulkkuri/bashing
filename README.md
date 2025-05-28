# BASH FUNCTIONS 
 
Some reusable string and collection functions in pure bash. Requires Bash 4+.

Scripte are grouped in following sets as per their operations
- Strings operations
- Collections ,set array operations
- netprobe ,common network connectivity tests
- gitguess, get history of git commands from logs

## Documentation

- Strings [`string`](https://github.com/bipulkkuri/bashing/blob/main/string.sh#L7-L105).
- Collections [`collection`](https://github.com/bipulkkuri/bashing/blob/main/collection.sh#L7-L20).

## Install

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/install.sh | sudo bash
```

## UnInstall

```
curl -fsSL https://raw.githubusercontent.com/bipulkkuri/bashing/main/uninstall.sh | sudo bash
```

## Sample examples 
```
examples/string_example.sh 
examples/collection_example.sh
```

## netprobe execution Requires sudo access
```
sudo netprobe www.gogole.com
sudo ./netprobe.sh www.gogole.com

-------------- ping www.gogole.com  --------------
PING www.gogole.com (142.250.72.99): 56 data bytes
64 bytes from 142.250.72.99: icmp_seq=0 ttl=116 time=44.905 ms
64 bytes from 142.250.72.99: icmp_seq=1 ttl=116 time=37.653 ms
64 bytes from 142.250.72.99: icmp_seq=2 ttl=116 time=35.638 ms
64 bytes from 142.250.72.99: icmp_seq=3 ttl=116 time=22.760 ms
64 bytes from 142.250.72.99: icmp_seq=4 ttl=116 time=31.596 ms

--- www.gogole.com ping statistics ---
5 packets transmitted, 5 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 22.760/34.510/44.905/7.291 ms
✅ ping Connection successful

-------------- DNS www.gogole.com  --------------

; <<>> DiG 9.10.6 <<>> www.gogole.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 48413
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;www.gogole.com.			IN	A

;; ANSWER SECTION:
www.gogole.com.		300	IN	A	142.250.65.163

;; Query time: 67 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Fri May 23 23:34:29 EDT 2025
;; MSG SIZE  rcvd: 59

✅ dig Connection successful
-------------- nmap www.gogole.com 80  --------------
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-23 23:34 EDT
Nmap scan report for www.gogole.com (142.250.72.99)
Host is up (0.029s latency).
rDNS record for 142.250.72.99: lga34s32-in-f3.1e100.net

PORT   STATE SERVICE VERSION
80/tcp open  http    gws
| http-server-header: 
|   gws
|_  sffe
|_http-title: Did not follow redirect to https://www.google.com/
| fingerprint-strings: 
|   GetRequest: 
|     HTTP/1.0 200 OK
|     Date: Sat, 24 May 2025 03:34:36 GMT
|     Expires: -1
|     Cache-Control: private, max-age=0
|     Content-Type: text/html; charset=ISO-8859-1
|     Content-Security-Policy-Report-Only: object-src 'none';base-uri 'self';script-src 'nonce-UNOnUr7hkINNi7i1UUDR_g' 'strict-dynamic' 'report-sample' 'unsafe-eval' 'unsafe-inline' https: http:;report-uri https://csp.withgoogle.com/csp/gws/other-hp
|     P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
|     Server: gws
|     X-XSS-Protection: 0
|     X-Frame-Options: SAMEORIGIN
|     Set-Cookie: AEC=AVh_V2gnVXUju6vfR-yD063rknmhYVndgw1SkIoBp6BUq8ImIUx72gfq0Q; expires=Thu, 20-Nov-2025 03:34:36 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
|     Set-Cookie: NID=524=MzEPHfs0d1DdF9kd7AVQ0C9jUSWpnaC6tJM_fjjq5WYbIxM4oWoZfGM4uh_ZOxrbwrbvRtopjNXus27genVvRWtZH5S9QQm5tFXVf6uPyvEM4gvWd8s-qp6_g6_edUKIb95D-6lB1a90aQ9jSXjUp109bycTFswWWqs3oa__pgKYigm4Xlsev
|   HTTPOptions: 
|     HTTP/1.0 405 Method Not Allowed
|     Content-Type: text/html; charset=UTF-8
|     Referrer-Policy: no-referrer
|     Content-Length: 1592
|     Date: Sat, 24 May 2025 03:34:36 GMT
|     <!DOCTYPE html>
|     <html lang=en>
|     <meta charset=utf-8>
|     <meta name=viewport content="initial-scale=1, minimum-scale=1, width=device-width">
|     <title>Error 405 (Method Not Allowed)!!1</title>
|     <style>
|_    *{margin:0;padding:0}html,code{font:15px/22px arial,sans-serif}html{background:#fff;color:#222;padding:15px}body{margin:7% auto 0;max-width:390px;min-height:180px;padding:30px 0 15px}* > body{background:url(//www.google.com/images/errors/robot.png) 100% 5px no-repeat;padding-right:205px}p{margin:11px 0 22px;overflow:hidden}ins{color:#777;text-decoration:none}a img{border:0}@media screen and (max-width:772px){body{background:none;margin-top:0;max-width:none;padding-right:0}}#logo{background:url(//www.google.com/images/branding
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port80-TCP:V=7.95%I=7%D=5/23%Time=68313E4C%P=arm-apple-darwin24.2.0%r(G
SF:etRequest,15E0,"HTTP/1\.0\x20200\x20OK\r\nDate:\x20Sat,\x2024\x20May\x2
SF:02025\x2003:34:36\x20GMT\r\nExpires:\x20-1\r\nCache-Control:\x20private
SF:,\x20max-age=0\r\nContent-Type:\x20text/html;\x20charset=ISO-8859-1\r\n
SF:Content-Security-Policy-Report-Only:\x20object-src\x20'none';base-uri\x
SF:20'self';script-src\x20'nonce-UNOnUr7hkINNi7i1UUDR_g'\x20'strict-dynami
SF:c'\x20'report-sample'\x20'unsafe-eval'\x20'unsafe-inline'\x20https:\x20
SF:http:;report-uri\x20https://csp\.withgoogle\.com/csp/gws/other-hp\r\nP3
SF:P:\x20CP=\"This\x20is\x20not\x20a\x20P3P\x20policy!\x20See\x20g\.co/p3p
SF:help\x20for\x20more\x20info\.\"\r\nServer:\x20gws\r\nX-XSS-Protection:\
SF:x200\r\nX-Frame-Options:\x20SAMEORIGIN\r\nSet-Cookie:\x20AEC=AVh_V2gnVX
SF:Uju6vfR-yD063rknmhYVndgw1SkIoBp6BUq8ImIUx72gfq0Q;\x20expires=Thu,\x2020
SF:-Nov-2025\x2003:34:36\x20GMT;\x20path=/;\x20domain=\.google\.com;\x20Se
SF:cure;\x20HttpOnly;\x20SameSite=lax\r\nSet-Cookie:\x20NID=524=MzEPHfs0d1
SF:DdF9kd7AVQ0C9jUSWpnaC6tJM_fjjq5WYbIxM4oWoZfGM4uh_ZOxrbwrbvRtopjNXus27ge
SF:nVvRWtZH5S9QQm5tFXVf6uPyvEM4gvWd8s-qp6_g6_edUKIb95D-6lB1a90aQ9jSXjUp109
SF:bycTFswWWqs3oa__pgKYigm4Xlsev")%r(HTTPOptions,6DC,"HTTP/1\.0\x20405\x20
SF:Method\x20Not\x20Allowed\r\nContent-Type:\x20text/html;\x20charset=UTF-
SF:8\r\nReferrer-Policy:\x20no-referrer\r\nContent-Length:\x201592\r\nDate
SF::\x20Sat,\x2024\x20May\x202025\x2003:34:36\x20GMT\r\n\r\n<!DOCTYPE\x20h
SF:tml>\n<html\x20lang=en>\n\x20\x20<meta\x20charset=utf-8>\n\x20\x20<meta
SF:\x20name=viewport\x20content=\"initial-scale=1,\x20minimum-scale=1,\x20
SF:width=device-width\">\n\x20\x20<title>Error\x20405\x20\(Method\x20Not\x
SF:20Allowed\)!!1</title>\n\x20\x20<style>\n\x20\x20\x20\x20\*{margin:0;pa
SF:dding:0}html,code{font:15px/22px\x20arial,sans-serif}html{background:#f
SF:ff;color:#222;padding:15px}body{margin:7%\x20auto\x200;max-width:390px;
SF:min-height:180px;padding:30px\x200\x2015px}\*\x20>\x20body{background:u
SF:rl\(//www\.google\.com/images/errors/robot\.png\)\x20100%\x205px\x20no-
SF:repeat;padding-right:205px}p{margin:11px\x200\x2022px;overflow:hidden}i
SF:ns{color:#777;text-decoration:none}a\x20img{border:0}@media\x20screen\x
SF:20and\x20\(max-width:772px\){body{background:none;margin-top:0;max-widt
SF:h:none;padding-right:0}}#logo{background:url\(//www\.google\.com/images
SF:/branding");
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running (JUST GUESSING): Apple macOS 12.X (85%)
OS CPE: cpe:/o:apple:mac_os_x:12
Aggressive OS guesses: Apple macOS 12 (Monterey) (Darwin 21.1.0 - 21.3.0) (85%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 10 hops

TRACEROUTE (using port 443/tcp)
HOP RTT       ADDRESS
1   9.90 ms   192.168.1.1
2   27.78 ms  100.93.139.131
3   27.80 ms  po-310-345-rur201.49thst.pa.panjde.comcast.net (162.151.208.165)
4   27.79 ms  po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)
5   27.82 ms  po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)
6   172.19 ms be-201-ar03.ivyland.pa.panjde.comcast.net (96.108.181.21)
7   172.20 ms be-201-ar03.ivyland.pa.panjde.comcast.net (96.108.181.21)
8   36.30 ms  142.251.249.125
9   36.33 ms  142.251.249.199
10  30.64 ms  lga34s32-in-f3.1e100.net (142.250.72.99)

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 74.70 seconds
✅ nmap Connection successful

-------------- MTR www.gogole.com 80  --------------
Start: 2025-05-23T23:35:44-0400
HOST: Bipuls-MacBook-Pro.local    Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.1.1                0.0%     5   11.2   8.8   6.9  11.2   1.9
  2.|-- 100.93.139.130             0.0%     5   17.7  19.6  15.5  26.2   4.3
        100.93.139.131                   
  3.|-- 24.124.232.45              0.0%     5   19.6  17.7  14.5  20.8   2.7
        162.151.208.165                  
  4.|-- 68.86.208.146              0.0%     5   18.2  21.6  17.0  27.4   4.7
        68.86.208.25                     
  5.|-- 68.86.153.245              0.0%     5   27.4  22.7  17.9  27.4   3.8
        68.86.208.25                     
  6.|-- 68.86.153.245              0.0%     5   19.9  22.6  19.5  26.8   3.1
        96.108.181.21                    
  7.|-- 96.108.181.21             60.0%     5   21.1  26.2  21.1  31.3   7.2
  8.|-- 209.85.244.105            60.0%     5   29.7  31.0  29.7  32.4   1.9
        142.251.249.125                  
  9.|-- 142.251.65.95              0.0%     5   25.9  29.3  25.7  34.4   4.3
        142.251.249.127                  
        142.251.65.93                    
        142.251.249.125                  
 10.|-- 142.251.65.95              0.0%     5   35.0  31.8  21.6  43.7   8.5
        142.250.72.99                    
        142.251.65.93                    
 11.|-- 142.250.72.99              0.0%     3   32.9  31.5  30.0  32.9   1.5
✅ mtr Connection successful

-------------- Traceroute www.gogole.com 80  --------------
traceroute to www.gogole.com (142.250.72.99), 30 hops max, 40 byte packets
 1  192.168.1.1 (192.168.1.1)  16.402 ms  6.662 ms  5.094 ms
 2  100.93.139.131 (100.93.139.131)  20.251 ms
    100.93.139.130 (100.93.139.130)  23.211 ms
    100.93.139.131 (100.93.139.131)  18.995 ms
 3  po-310-345-rur201.49thst.pa.panjde.comcast.net (162.151.208.165)  22.834 ms
    po-310-346-rur202.49thst.pa.panjde.comcast.net (24.124.232.45)  23.247 ms
    po-310-345-rur201.49thst.pa.panjde.comcast.net (162.151.208.165)  16.685 ms
 4  po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)  25.088 ms
    po-2-rur202.49thst.pa.panjde.comcast.net (68.86.208.146)  22.784 ms
    po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)  27.029 ms
 5  po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)  30.810 ms
    be-4-rar01.coatesville.pa.panjde.comcast.net (68.86.153.245)  18.651 ms
    po-200-xar02.49thst.pa.panjde.comcast.net (68.86.208.25)  25.624 ms
 6  be-201-ar03.ivyland.pa.panjde.comcast.net (96.108.181.21)  29.876 ms
    be-4-rar01.coatesville.pa.panjde.comcast.net (68.86.153.245)  21.180 ms
    be-201-ar03.ivyland.pa.panjde.comcast.net (96.108.181.21)  34.946 ms
 7  be-201-ar03.ivyland.pa.panjde.comcast.net (96.108.181.21)  29.392 ms *  38.784 ms
 8  * * *
 9  * * *
10  * * *
Aborting traceroute: 3 consecutive hops with no reply.

-------------- Certificate www.gogole.com 443  --------------
expiration_date Jul 22 19:30:13 2025 GMT
macOS: detected
Certificate for www.gogole.com expires in 59

-------------- nc Connection www.gogole.com 443  --------------
Connection to www.gogole.com port 443 [tcp/https] succeeded!
✅ nc Connection successful

-------------- curl www.gogole.com  --------------
HTTP/1.1 301 Moved Permanently
Location: https://www.google.com/
Cross-Origin-Resource-Policy: cross-origin
X-Content-Type-Options: nosniff
Server: sffe
Content-Length: 220
X-XSS-Protection: 0
Date: Sat, 24 May 2025 03:35:38 GMT
Expires: Sat, 24 May 2025 04:05:38 GMT
Cache-Control: public, max-age=1800
Content-Type: text/html; charset=UTF-8
Age: 73

✅ curl Connection successful
 

```

## git guess execution
```
gitguess /ndt7-measurement

📘 Guessing git commands 
Working on /ndt7-measurement/.git
🔹 Commit by: bipulkuri on 2025-05-21 14:06:16 -0400
🔸 Hash: cafa0e7236db25af5663b4dd96a18e48383402f2
📛 Refs: refs/heads/main
🟢 Added:    git add .gitignore LICENSE README.md config.ini ndt7_discover.py ndt7_download.py ndt7_test.py ndt7_upload.py notes.txt requirements.txt
             git commit -m 'first commit'
----------------------------------------------------
🔹 Commit by: bipulkuri on 2025-05-21 19:23:37 -0400
🔸 Hash: 980ac9b284e6b9756211f232ed0c474301c39344
📛 Refs: refs/heads/main
🧬 Parents: cafa0e7236db25af5663b4dd96a18e48383402f2
🟢 Added:    git add utils.py
🟡 Modified: git add README.md ndt7_discover.py ndt7_download.py ndt7_test.py ndt7_upload.py notes.txt
             git commit -m 'formatting,refractor support local and prod'
----------------------------------------------------
🔹 Commit by: bipulkuri on 2025-05-21 19:34:57 -0400
🔸 Hash: 6f1ea87debc74f0116f6a2e9caa4fe1aecae0081
📛 Refs: refs/heads/main
🧬 Parents: 980ac9b284e6b9756211f232ed0c474301c39344
🟡 Modified: git add config.ini ndt7_download.py
             git commit -m 'add discoveryurl'
----------------------------------------------------
```

## How to include these functions in your scripts after install

test.sh
```
#!/bin/bash
source string

str="Hello world"
echo  ""
reverseallcase "$str"
```

Run 
```
$bash ./test.sh 
hELLO WORLD

```

## Extending 

More functions can be added 
add your script.sh file reference in `SCRIPT_NAMES=("string" "collection")` in install.sh and uninstall.sh


# Contributing

Feel free to fork and extend.


# License
This project is licensed under the [MIT License][License].

[License]: ./LICENSE

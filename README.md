Shell-and-Hunter
------
>Connecting with lots of GitHub Repo.  
  
English | [简体中文](./README_CN.md) | [Kali Linux](./split_for_kali-Debian7.md)  
  
#### Notice
- cURL GitHub URL as Input, Read Features before start.  
  
## Usage
``` 
VPS with Debian9.x was tested.  
apt update
apt install -y -q git
cd /root
git clone https://github.com/fngoo/sh
bash sh/du_hast.sh
```
## Features
- [x] One-click deployment 
- [x] Against broken SSH process
- [x] Parallel based on CPU of server
- [x] Edit in Web（one.sh : target="curl github_url"）  
Customize your Input, Single Domain or SubDomain.  
- [x] While true sleep 6s, running if Input changed.   
## Flow
- [x] SubDomain gathering(multi)
- [x] DNS resolve
- [x] Github sensitive info
- [x] Cloud based bucket(s3 bucket/Azure/Google bucket)
- [x] SubDomain Hijack and Broken Link Hijack
- [ ] HTTP Smuggling
- [ ] DNS-server Cache Poison
- [x] Web services screenshot
- [x] Web tech analyzing
- [x] Crawler
- [ ] waybackMachine URL(memory error)
- [x] Param discovery
- [x] XSS
- [x] HTML sensitive keyword
- [x] CRLF
- [x] JavaScript sensitive keyword
- [x] JavaScript endpoint gathering
- [x] DirScan and screenshot
- [x] chaitin/XRAY webscan
- [ ] Correct PoC about Web or port tech  
- [x] Port scanning and tech fingerprint  
- [x] Unauthorized detection(ftp, Memcached, mongodb, zookeeper, Redis, elasticsearch)  
## Output
- [x] Alerting(Slack API)
- [x] Web browser(Python SimpleHTTPServer)
- [x] Exploit DB Web newest PoC monitoring, if match the keyword of Web tech then alert(Slack API)  
- [ ] Exploit DB newest PoC monitoring, if match the keyword of Port tech then alert(Slack API)    
- [x] Extracting valuable info to .txt  
- [x] .zip file, unzip to Web Python SimpleHTTPServer  
## Disclaimer
**Don't be a dick.**   
## Author
Kuruma(Armored)
## License
I don't believe in License.

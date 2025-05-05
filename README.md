# <h1>Subdomreco</h1>

**Subdomreco** is an automation script for subdomain reconnaissance that integrates multiple powerful tools like **Sublist3r**, **Subfinder**, **Assetfinder**, **Amass**, **Findomain**, **httpx**, and **Aquatone**. It simplifies the subdomain enumeration process and identifies live domains with visual reports.

## 🚀 Features

* Automates installation of required tools.
* Performs subdomain enumeration using:

  * [Sublist3r](https://github.com/aboul3la/Sublist3r)
  * [Subfinder](https://github.com/projectdiscovery/subfinder)
  * [Assetfinder](https://github.com/tomnomnom/assetfinder)
  * [Amass](https://github.com/owasp-amass/amass)
  * [Findomain](https://github.com/findomain/findomain)
* Merges results into a single list.
* Filters Yahoo subdomains.
* Checks which subdomains are alive using [httpx](https://github.com/projectdiscovery/httpx).
* Generates visual reports using [Aquatone](https://github.com/michenriksen/aquatone).

## ⚙️ Installation

Clone the repo and run the script:

```bash
git clone https://github.com/5r4z4/subdomreco.git
cd subdomreco
chmod +x subdomreco.sh
./subdomreco.sh
```

> **Note:** The script will automatically install necessary tools. Make sure you're running on a Debian-based Linux system with `sudo` privileges.

## 🛠 Usage

The script will prompt you to enter a target domain:

```bash
Enter a domain name:
example.com
```

After processing, your results will be:

* `sublist3r.txt`
* `subfinder.txt`
* `assetfinder.txt`
* `amass.txt`
* `findomain.txt`
* `total.txt` - Combined results
* `sortedfinal.txt` - Yahoo-only subdomains
* `live.txt` - Alive subdomains
* Aquatone HTML report (if browser-supported)

## 📂 Output Example

```text
live.txt:
login.yahoo.com
mail.yahoo.com
...
```

Aquatone screenshots will be saved in the default `aquatone_report` directory.

## 📌 Requirements

* Linux (Debian/Ubuntu recommended)
* `sudo` privileges
* Internet connection


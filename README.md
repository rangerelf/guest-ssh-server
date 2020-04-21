# Guest SSH Server

This is a docker container that spins up a minimal
Alpine container with openssh and bash.

## Usage:

Upon startup, it'll create the ssh host keys, create
a random `guestXXX` user with a randomly created password
and ssh key, then report that to the console.

Use the included makefile to start it up:

```sh
$ make run
docker run -ti --rm -p 2222:22 ssh-server:local
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
## Creating Guest User
## Login: guest165
## Password: x4Gs0mDauw6yYQ
## chpasswd: password for 'guest165' changed
####################################################################
## Guest users key:
-----BEGIN OPENSSH PRIVATE KEY-----
ktNem1999yfVyET2a9sbYK+1EH36XBHOPdqHzu28nuCaO9roMNY1hPh3IkwblMYCLE1AGAJFiLUU
qjarVLsWO2GZh1F07FHtZhyssVpzbjTMhqAidCsJGJ9U78DJFTvOknM8xtTdROtyx395Hy4gZsi3
6wteKoJpIMnthdMBbdX1yujeTJpAAFeE1+k3jmFxQ4m2nITNgpz1p5jlqBuztsLj9b2IZYyi+gkZ
rJKEUf9rsHxyr9QAbnBlDyEkqoVDB6clpITsPG8BiNhdrybOpd9D1gWuOCFeuNZXSJVYQ7thnIni
YNC9VF7pAzu4rUxVOcj/3cCT3hVI+MAn6JYXIayQm1lHEv0RzSwcm6+6+aKD0yWtVIHnakAvFuy1
nGpXr7nRQyKr7c5p1PmPTyDx9UMrkMBCO49Lke+zkS50/chgSCn7UeSqSDF+/9fhlcRJy91fnddq
rgZGmuDGa3vaKPA/lZ30GHD2S3N4Y2zrDYCxXyalCdDZhDQrIpsllu7m/yUMLdqlu4G9HpvkAPhW
YD0a94fSssAMHJq2E4uxnac5mGEb55Lr3K2nyiYR24UabDKIWBSwb5bMb4PQPRB8UPipgChwQXxp
UV6vPaxKmlMsesjBQKw7Pwfk0+nXnGkaDlwwDlQ84legpnoOmj+YmNn+phta5ufuw8Geho5OR8mp
NQEFL0dm8f85MXrbpV4Yk15a00Ue2gfn7j9341iumgnVuyUcMXS1h/QBmyvSuYOSJ6mDZt8n/NP1
+sbnL5JLR+7jEEPsrbD+uFYGf3j9sun6KHsVjeGf/tFwcPShpBCxjBuCAeZzagd22JSm9uw6mEcJ
rracnedytEphgj+xtmLJcLLdZm814YpJxd39Prco1FwZrcjubuvWzZyuwD3/WNl97wYfTzpn2a6N
UChB7enFzg+Dld9ew8y4FJzTgzbZqHJ1rPiAwljMMqZpBBPM3mr4ZqY86uw9+S+uawoTcwF2K1or
xMXnbRBtRuWIDpWhftCK0r0PXDOvk6ml+zGf
-----END OPENSSH PRIVATE KEY-----
####################################################################
```

It will create a random login, with random password and random ssh key;
you can then share that information with whomever needs an emergency
temporary ssh login.

Once the need for it has passed, press `^C` at the console and it'll
disappear.  

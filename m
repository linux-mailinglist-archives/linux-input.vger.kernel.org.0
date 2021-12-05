Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4577468A7C
	for <lists+linux-input@lfdr.de>; Sun,  5 Dec 2021 12:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbhLEL2C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Dec 2021 06:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhLEL2C (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Dec 2021 06:28:02 -0500
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432E2C061714
        for <linux-input@vger.kernel.org>; Sun,  5 Dec 2021 03:24:35 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4J6PNK1wy5zQl8j
        for <linux-input@vger.kernel.org>; Sun,  5 Dec 2021 12:24:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolahilft.de;
        s=MBO0001; t=1638703471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=uzs0hwI31EV9A31lCIemWgYkeIzx0byImoznu0hLdQI=;
        b=SQ64Plu+PSHONoUAsVFQgt3g8+cziSd4e71H+efvdhBTyGCD0zZOTGDfX8ErsGa/fvyUmG
        8CRND9aX2H7kP/foE+yVe7BchK8Cz2OsRrT14npUjdOBOA0mn5UxvFDflapMqRABAeH3M8
        iyOMrGJnnsIyugdmvp8c8vlaLxdcJ+7uM+fifeww9QEL8YMssigDH+INa/0bCQLvT9mZlp
        qzSCbJeW07ic8tEcl6++BilgalLA++7jBWxFAZrMo5RP1ACJ48CaOxqxgJW2TvOFLR9V7a
        EWEtoLAYMGMMS5/+gBNzZ0Goie8APUhoQMyA32N47xI5HVRp2BLRF3nx756NdA==
To:     linux-input@vger.kernel.org
From:   "kolAflash@kolahilft.de" <kolAflash@kolahilft.de>
Subject: reporting: try setting psmouse.synaptics_intertouch to 1
Message-ID: <67f231a3-5db8-95dd-fbb8-5faa491456f2@kolahilft.de>
Date:   Sun, 5 Dec 2021 12:24:28 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hoUQJArByHeKU50naSr72nwDydbXpdEN8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hoUQJArByHeKU50naSr72nwDydbXpdEN8
Content-Type: multipart/mixed; boundary="Ur3u8y9tfwzwDv9M1VYrWRnal3joz0KsM";
 protected-headers="v1"
From: "kolAflash@kolahilft.de" <kolAflash@kolahilft.de>
To: linux-input@vger.kernel.org
Message-ID: <67f231a3-5db8-95dd-fbb8-5faa491456f2@kolahilft.de>
Subject: reporting: try setting psmouse.synaptics_intertouch to 1

--Ur3u8y9tfwzwDv9M1VYrWRnal3joz0KsM
Content-Type: multipart/mixed;
 boundary="------------465619FB44207AA9B820EDD6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------465619FB44207AA9B820EDD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

my dmesg says I should report this here:

| [    3.316088] psmouse serio1: synaptics: Your touchpad (PNP: SYN3286
| PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi=20
are not
| used, you might want to try setting psmouse.synaptics_intertouch to 1 a=
nd
| report this to linux-input@vger.kernel.org.

Notebook
Model: HP 250 G7
ProdID 15S85ES#ABD


Background:

My mouse and keyboard randomly stop working.
See here for details:

https://bugzilla.kernel.org/show_bug.cgi?id=3D215017
(there are also more system details like "lspci")

It looks like psmouse.synaptics_intertouch is fixing this issue.



Kind regards,
kolAflash

--------------465619FB44207AA9B820EDD6
Content-Type: application/pgp-keys;
 name="OpenPGP_0xEA831012D83C3408.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xEA831012D83C3408.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFHnKPMBEADUjhjFJBbCImfPKG1IZphRTf+8HSYd9d/xob9xJAvQ719knlKz7B8Q9HHlo=
FIi
MRwqlyPYiTj3/IZIz0WsWZaT9l5ijBM0p4yUL4iWRZhlVJX+vUpeHRHHaClui5h3+V7jZF1/j=
/cR
uxrO8x5Wb6s0MlBF9lIyD9+3iIBZCBZqifClyVPq7HqBzCbZMz9+HYVNG4/uEwIx80B/dAfyu=
daG
MIfE5fusNHiHVKCQrlAdQSJ4hMoXkv0mIPOA1ehnbTvbwtEFePvuU+/26G7jBjKc8Rxolw5jr=
00b
rRPB97HECnG3q46PvgKHIiTKwpr/jr+e3pNcPzwhP2g2L5ATcS67VTtOvoUnxcvnokHzvvPc6=
2jg
XD3QSXHDim9rEAaxGXXlUdywpO3UGs39igrKTOwM1VgTHmgV3tl3YT/uehdLzq/E9jYCPrzo6=
dqO
Y1+uRPaCrM3rtGYq8fSyT7PH1Utw645SaJI19kzBp71DqphiwUuqoBLpEnTu/iZJGNGhO3ttR=
564
jniIlEmYt+hN6gCoQRErEg5Vtx5IEdt9+rSR5UWOqNqE3lcjUd6i89dJGl9aoVMrxuImgg0Mz=
8w+
dtAwqz24gwRcP2X6qLH9I/BB/uvl3uEFXRkSH/mLusjbhypYnOFrr8IwyAKUY3uToFxvMhRS/=
otK
1ydLJCJVLU/vxwARAQABzS9rb2xBZmxhc2hAa29sYWhpbGZ0LmRlIDxrb2xBZmxhc2hAa29sY=
Whp
bGZ0LmRlPsLBmQQTAQIAQwIbIwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEEsfSER=
nbC
EIlrTymb6oMQEtg8NAgFAl7TBIkFCRZR3RYACgkQ6oMQEtg8NAiIRBAAnv59D8ha5VQ+E5oOJ=
vyf
OiJaHiH3ekEpfJC/tSpyfD4hZedItz2Ip5AjqTcmqnzcU+6R/8rkAIOA08qBohXdh28NIbug4=
1NG
rv0sS/k6ifINnJQeR3vxQDaVwpOriTPZGHBQD6uJTPsiD5fOrApD+dKv1fCsg2qF032+t6rrI=
CrV
IQZAvNLVJsArf8SN9FtVnymbaxkxEFnWTttbU0pgsmVMB7F5jgnd7a/t7Hx97RhqzB8bZ88+g=
LZW
MsX4Y1e9DAR88jgDLa1XnSlj0/aIn64vmu9vcXt2L+l+iKq+q2XQgj7fN4zIPzVP45JrMTgZq=
ByE
gvo8e6/OR621asVUJnhL8k+EIdO+cqG3DH2On2U9WsRJopvAL/kQ4BlJma1aPzELfQSdRYA/p=
w5O
yVqQpgUrXowL2ve+H6BM3zLzCRkqCvSxalg7cQYawKxXAQgtWvM4ugBBWYLtryMZwUwwyapvE=
Cqy
SC+fXBqUAv517Mi8lDL0+jFwgKSr3xeSNtacMr1zyhzz+Gp/3tmkDIeeE1n4hM0k8aswSI6pK=
DvG
vyrsr2JS4gOeL63D2DgV5VTiQNlvREah4xGEzCwOOEE/KwnTP6v9elRuC8j6Kcx8LEObwAhIo=
1nS
18NNqIDBdwsjAxEmLDwww/8rLXZ48tRzVidFyi+d8AV4+4o++ehPmh/NKWNvbEFmbGFzaEBnb=
WFp
bC5jb20gPGNvbEFmbGFzaEBnbWFpbC5jb20+wsGWBBMBAgBAAhsjBwsJCAcDAgEGFQgCCQoLB=
BYC
AwECHgECF4AWIQSx9IRGdsIQiWtPKZvqgxAS2Dw0CAUCXtMEigUJFlHdFgAKCRDqgxAS2Dw0C=
G5J
EACmeFBb9LA9fPr2SNqXKVgXeOHbBfHKu44f2qGxXW8NGDUllYhuF9QOXeal9v996TO313+yV=
Gen
Fl2YJW772G7K7hhdMIbDESmf/zFe6SK4r9YW5wZvks8Kk2O+F17CP9V+3xzHlE/8L2Y0YUU6l=
Xxb
R8cfeqfjIATm8vHN/GidOCi+aBZd4cL0WE6CrfEFCZ7iQDRQndzGiOvsgHaEJ8N0lSILR/50S=
NBU
RF8nb/3NNnk/X7L76P4d2Z3YfwOuw44KAWUSsC7LxfonWnetknRxuAiJLfDAzYeiVFzhMNOun=
ZlU
dAyz3x9bOEfMkgkN0tYy3IV90edKTrTTQbeXg01oz2GouD40PsnHgSA5H0xNlliKTtxX/YSHc=
zLJ
FF4Pe1lN+upTD6fMb4NebQnVGdpacrRyXaEGdPPlpBSvWaSyUXJUcPxS+mOMUg/TDMXM9FKIX=
ceW
d9AjCf7o9l6lXNpW1F0HyX6B7FdaRiTqtHM/3+8fTMg+rebtVDiwRLvUbC7Jzw4Esc0QKySBM=
WYU
kpXMYakU5pww//kitXCo4HbEqvgaz3rLBra2Z8+KbeICpWSLcHPjOn0H9XdnIWD6UqgsnbMo4=
7uS
ulDIPyWTA3P1oOTTgpSQIZysVqzuy0J1n6J/nXvHLypDovhB8ZMrKykE/9HgZrh8BsWNOsYM3=
2+z
7c7BTQRR5yjzARAA0cugTyj3ubdRNhybvehfDiK6KdZqvoaDYcI7EUxNEysIrhDNXmi8Q5wK2=
KRo
j+vcQtZ1Q3nnq6hYm9JLHjBrwauQxaO2bFeNmR3psa+KXzdm/cJVPplILyFpgRF4B1bmB/PGl=
Vk7
eeJ4trgw7ojOXJ43ITRD1a0I6ZFrwoWOGtMWYtfgT0v6tcxhBv6kB2vjp+sf9zqk6Lb4bHY5L=
15S
804Eid1aN2n3ofh56sruijSoRtdO6oTT6T+X34hyWwyocUPWb4GlBendKmI41Yup/VE/3Fr+Z=
D8d
OSavq3JOXGGF050Iq7lR+XPjshe9IF/2bqivA6dJiRcpHM62q8wNQRSKS1ycIat1uh+W2eDHz=
gS7
CjZrcjkUHICZIO1++c1gW6YV71u10OoOR9CAAwF4TRqNSDfebuSCRxoSyRBw2TZQlwdNdXpfL=
0No
9cbo4lJ8Fccp2VXJlyLIwegjK096fLStIqRfh3rsTP041Qn2vLSlMCKFmCbGkI4uorx1p+Bna=
HVZ
2/C/7N+QdI/amwQk5FhvpVNZOy/shY3ig41fg99MugdX4qtocY3wqtXvMniUcEv2JHHQ9G0dn=
cUZ
8qwK8H4XsLfLbq2nwMnfM6fwvMPwR170r9BERr+2vg7b+lNN0vyyuUzTWnbNKJS+8FvHdHW9o=
go3
fF3/3oLwlNJ105UAEQEAAcLBfAQYAQIAJgIbDBYhBLH0hEZ2whCJa08pm+qDEBLYPDQIBQJe0=
wSK
BQkWUd0XAAoJEOqDEBLYPDQINqEP/2JMPvubnU8TM5vTXh5AudoP2S2tLXsAA6fVxbFtZcJEN=
Fve
NTkP0TfwWd2WJT5YdAsJNKmjABPRm+kY67gB+MI34MSfolBy1W5JGCEtBczQn7ccHbY/0FKwo=
zCk
93AzsLzQAdiHcGag3SMOL2evq4ZryRIp9XBQ9PCMito6eZN01RVvpu4kegH4lFWrRjZlEM5Ey=
U3D
ww+4/semjJEa8+8Z7tkOvsC9YGWXSpOUuq3pc17R59Wms4s/+AagAiQrLOix1cPO1J41TgDZB=
tyd
uPHrh8G0oYnCHPJ7mGjI8YPqrEsXU+72OSYqikw7riWK1wi+prwxUMFYWRkNisd/mDMF471XG=
Wyn
3NRLgPwS1eLLXphPiYZElRnagGIpTAgmX+BUOt13WVCF4xIJycGTXMCSwAcUkuntEqH54bzd6=
QQM
noWIZOlKZJUasbKjMsf9sI0WugqSPUOBBErVWn+YDU/wn5M8WMXPLAcc2iLZOjzK7zaWZL/fO=
sUc
aKttn688Vvt5Te/Aik7soBWqzL8hwmMQe95zKvwtudN/5ArEAx1dIPWaLCCu/o097AoxpqXn/=
Jnt
7nv7D822y6koCvCBwwwvQLOPKgc2Car3x8NqDGptIlIicTegYPwQXHX8QNl3JoX2Viib4Codp=
GJA
5wMy/BgiuE+i1fTHDh6jxYQO3P+x
=3DHIys
-----END PGP PUBLIC KEY BLOCK-----

--------------465619FB44207AA9B820EDD6--

--Ur3u8y9tfwzwDv9M1VYrWRnal3joz0KsM--

--hoUQJArByHeKU50naSr72nwDydbXpdEN8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEsfSERnbCEIlrTymb6oMQEtg8NAgFAmGsoWwFAwAAAAAACgkQ6oMQEtg8NAhk
dg//X/WH66p92SHnMSLRLjf1nAuxwchVgx3YYxU+D6fZ1ziMDrrpjqXU4GdLJXwEm+rR8Y43XWwu
Gqdl1l9f6nwKgroA4i0LDJDZoydQ8vwxpqAMTaprt/FwCoFFlJ6AzrlROJmni78HFu3Kre4UPw4f
Wl12T8cDcBiFNWVfTcC8pxdlTjVQWa5eZMYQIi3vmAu6TauEx34p+nvuFavv16pe5qC9kVanN1dT
VzfGeh6RUx6j3EcMOzknir7ZsiDz1Y2NpPDe3l+/V0OPcg6GePm2cH82TtzGlg8aa97PtJcx5ZVt
lcIkvO0G9XPjxWZWQAcHyTPk5zsG+hOnsh40kUwUzkYseGogiIwadPqd7XBZg2A7Gsbo+RVPdqdG
yjMjn1YQyL9qQNBT5fn26iP3W0GaWWoXO1CJgUBy6LcURhonCP9O7VABIgrGHgxoShZCyFYartQR
QPx69RaqxJt/uwlSgeZaMgC7vu/I2Q9T57S2u3pN5P9ZrfLeEyYDJeMpjt6cyjGIjk5kAGt7Uxaw
bPhcxLEQOlOHf6XM3ObClxx0jy+rcCQPjkRbvZ25YvqHiKoRo1zmCG6Lk9zD/VysJs7cUFnpcmlt
r/krC0cL5drNavW4H5Etp6Ku1epnpvU1KgFFvk42loEwYN4MItCYx1/RKqjuzUTlyYFi+9LwKM3M
n/k=
=iMyO
-----END PGP SIGNATURE-----

--hoUQJArByHeKU50naSr72nwDydbXpdEN8--

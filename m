Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EA327B444
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 20:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgI1SRv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 14:17:51 -0400
Received: from sonic305-20.consmr.mail.ir2.yahoo.com ([77.238.177.82]:45838
        "EHLO sonic305-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726442AbgI1SRv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 14:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1601317068; bh=YiBnr4Uk8siI0dhikjlKOiXekrwpOWZKz+TPVjgu4sY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=SfV5V/Wb2i9fuP87SnukHcw0SS5tNqio4dpCR7+n0Iv9pew7571VjGHNX63AQVlIxxjGE4Jnkzf4tTUb0YKvKWu/9wquYY/X5hHCjwo3H3RK5H+gqvyYRAygeLzyq/Zp058/7BEJMbHIaVp5mFE/rzP9z0j9sAz9q0NrXPnkAvGnHuAN9jwKrHajjecVp9TpkZObjd0Er5i2L1+1fgAvRtq+hww6Yxk4L7Ab7mBiQ++c8M5YG5+azOgZijG8uphMpI7CMtaJudCLSwkS1RG6pt1HAUxc3GKe0ugOTaAkZq7jKyxYjpgZjO3/H00+mlXVK8d4vUumY4cIbJjWgRuIVw==
X-YMail-OSG: Xxa6V7cVM1m.Ofb1Dl78qBKfdSmGR3r.m1n2gCj2BQqEjnKhx9V.xp4qlukS40p
 NLfy02VBNHbQD8PujCKYf50FxNb9IfLKBHmep6gim7n4Y9TxQSbFtlCgmY4goiMJ3LJzz9nZSFHM
 .2wgWQCbcdbvGVB_9p6CDotz4kqBRXTWKXL0kzM.HuUoNL4isAj2sP3z94kam3L3glrZLx2xXoR5
 65jQEsdLNsERvjjvZIxqaOz_pUoWOBoEkuLK7DfpEhZ4Z4esHKXMVjScjvgRMQqIXELjyBBTqR82
 8_aJW3z_aUlcOqYYmB2gThf3Hsm2vJh_W4c8Gn2dO7uc5xOGc_3Ftjy.aIS3BVi_ONn4uboMQtq8
 HfSH9DtkG0Y703rfLquSYITF5_LU9_Q37UjfYTU45vS3qItgQfHCENubvy5JeLl8Z7SfLnpbMdmS
 kEURzsApEPmHbO3tbpOvw1Kv2wBPebIzapmOINGKu9yUvYa9Qggx_J1FxG6TJuZ5gqkQNv2il47C
 RTG3WxpK0pMiBAFsYvhtucUCN0BKSS3N08hecI3cMY3VAM7p5P8y9yXJveaSUfCWXxsOJrgm_x8.
 GTPm5uMLoDKoEN9kcIjP5Bn77FlIN5PJu.mtFClCElYaS1k.8si2hDMOOWjFN9z7xK6lFh0AZO1C
 Fc1kbpeGpXL_1PitHgaOUY8hoAIz8uW86FT209hLMIm97r7a5E655FexgKPz8q1g7lQ_PUbUWUFk
 XmX.e7EZdTKmxT6sMX5LVsWPRj4DU4b5iRMDx3sFuikDf3LTRU1WOIkQqhMIuE8peY1kcsm8Z.rn
 7u_2zZLsqxE_Te1T4Vsz.BNxWDDYcChvaJDoo5J3nFxh5Lk.RQs6LWrOuiUShRLIwfMhqKUYpnO0
 ysQj0FTsnV3VCcMHdMKm5Hx7O_54INW12XA7LUQYvKBnQJ2J2WPoZrhocMV9zueOf2AoRZW.Cj2G
 eC0DteZqP5oDNU4vHpJfXtCtda7FA39I6XNFK57dMvkS4E5emTB4X1gqeps0I5IdKhd3_tpJyRSg
 kk39EC9GRRaWEof8q7pNAm1vGZEX5HtQMJgyWznqltz.Ey9GZTynCHCEGj1WidneoRs8os.ltZeo
 uXN_dKtPK1uwQuevvAa7i0V9.zEfa5kBCy1NsSDO.oT2BRJHcaRUBk7vz4QyQfho030fDPIrWjc3
 0tEMYvuYaWul.ZjVBvdWna9w6m_ZcHP2Xl4c4cMIx7p7cz6h7Yerxd0BCto0fcLk7KzLnZ55DNT8
 CA0x_e9egeawvqBq6aklNlCPP40KX6ZG9PVbM4boCp9lDPRBtxe37_jjTSB3UcbGAi65CFqLDQI5
 kMA0MN.Z2xbyIeP7c5tQ41862gzvsv3IqFSCK2HsT95J3iPZ9M8uxx3EYwbIyZVJY5xugpB0FK02
 Gz.wMcIKjLu2.OWdejjOilqw9g0D1c1QCpcUQ2jqJJa_iPtp3Fz2vVz4A3k64jZX4UfsdUvDPcXS
 7cuSgZQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Mon, 28 Sep 2020 18:17:48 +0000
Date:   Mon, 28 Sep 2020 18:17:43 +0000 (UTC)
From:   " MRS. MARYAM COMPAORE" <mrscompaoremary2222@gmail.com>
Reply-To: mrscompaoremary2222@gmail.com
Message-ID: <329061065.2775219.1601317063947@mail.yahoo.com>
Subject: FORM.MRS.MARYAM C. RICHARD.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <329061065.2775219.1601317063947.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16674 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My Beloved Friend In The Lord.

Greetings in the name of our Lord Jesus  Christ. I am Mrs. Maryam C. Richar=
d, From Poland, a widow to late (MR.RICHARD BURSON from Florida , U.S.A) l =
am 51 years old and I am a converted born again Christian, suffering from l=
ong term  Cancer of the KIDNEY, from all indication my condition is really =
deteriorating and it is quite obvious that I might not live more than two (=
2) months, according to my Doctor because the cancer has gotten to a very w=
orst / dangerous stage.

My late husband and my only child died last five years ago, his death was p=
olitically motivated. My late husband was a very rich and wealthy business =
man who was running his Gold/Diamond Business here in Burkina Faso. After h=
is death, I inherited all his business and wealth. My doctors have advised =
me that I may not live for more than two (2) months, so I now decided to di=
vide the part of this wealth, to contribute to the development of the churc=
hes in Africa, America, Asia, and Europe. I got your email id from your cou=
ntry guestbook, and I prayed over it and the spirit our Lord Jesus directed=
 me to you as an honest person who can assist me to fulfill my wish here on=
 earth before I give up in live.

My late husband, have an account deposited the sum of $5.3 Million Dollars =
in BANK OF AFRICA Burkina Faso where he do his business projects before his=
 death, So I want the Sum $5.3 Million Dollars in BANK OF AFRICA Burkina Fa=
so to be release/transfer to you as the less privileged because I cannot ta=
ke this money to the grave. Please I want you to note that this fund is lod=
ged in a Bank Of Africa in Burkina Faso.

Once I hear from you, I will forward to you all the information's you will =
use to get this fund released from the bank of Africa and to be transferred=
 to your bank account. I honestly pray that this money when transferred to =
you will be used for the said purpose on Churches and Orphanage because l h=
ave come to find out that wealth acquisition without Christ is vanity. May =
the grace of our lord Jesus the love of God and the fellowship of God be wi=
th you and your family as you will use part of this sum for Churches and Or=
phanage for my soul to rest in peace when I die.

Urgently Reply with the information=E2=80=99s bellow to this My Private E-m=
ail bellow:=20

( mrscompaoremary392@gmail.com )

1. YOUR FULL NAME..........

2. NATIONALITY.................

3. YOUR AGE......................

4. OCCUPATION.................

5. PHONE NUMBER.............

BEST REGARD.
MRS.MARYAM C. RICHARD.


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1EA41A2788
	for <lists+linux-input@lfdr.de>; Wed,  8 Apr 2020 18:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgDHQw6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Apr 2020 12:52:58 -0400
Received: from mout.web.de ([212.227.15.14]:37937 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727187AbgDHQw6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Apr 2020 12:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586364754;
        bh=qJYnlXZVVFUtPwXcU+P6Py04mAQqsJ4+nGikGWgTZ+k=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=CS1LstZk89SbHuYdStwWN3Rg7oB74VqAQrLN2w0wt3xtopvj6Pm71sjotdmX22AhP
         cko/aSj9B0I+xLDbLcLHu9i3I5XQJWtzM/xuCmwsePmY8fci8yMuolU1TsUF5fKvFa
         RN7zYRS1+XrEp8mps9sBlByQ+9cNjhGx1A7qt1Zk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.170.28]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MVcvn-1jna610FcF-00Z1nS; Wed, 08
 Apr 2020 18:52:34 +0200
To:     linux-input@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Olof Johansson <olof@lixom.net>,
        Thomas Gleixner <tglx@linutronix.de>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: Input: ep93xx_keypad: Checking for a failed platform_get_irq() call
 in ep93xx_keypad_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
Date:   Wed, 8 Apr 2020 18:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:skPBZXgpslgIJa+q0JDAUv6Vwa6+tDwhjaMdKzEYORrvloMzVqK
 KGkZt3sVAJpSEP9xuWl3AAO5lQ66SH+1ZZdmzcCpzNGPwwsxa9Mb4raln8F7+L1Vojipf0/
 O70/9dvOujj0hAiG7CS15hj5HbsiU8RDwusqOlBJP4+HIY6nUod8AAmmkhE14E2JaLyi49d
 yBv7UH4yP1zWvBuiVpvmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:umpvU+EbiNk=:ynaetqHtnBFH5IrHeABHAN
 pWs2Z8F7VbWpTDfSdpure3IexqsqKH1vSAkr4zykF8YJdd5P2EHhpsPt1FyXn3t7AkJJwCv1d
 3uZkj6lkORV7qSnatCqTo6DFF9Hk3UQ81cbX/azdXIlJopSY4Hu5UTvcCayZxx7WCcQpW6mWQ
 6dci9ec5JooehyEV6BpVEh3FhIBjvotEyImUEWJ85pey7/io+LyMBjb8i3DBMxqGUW/G8dL9v
 Q9SI6qwU4WqwA4eNCNjHkGQf54DOqe9qm8hvkLC/xMaNcSjBJyQJq6b3BGjQ4LtX2p6vXljdy
 Y+bLMkEuI01D11vuSgbHVJupaZRl/Tk6TKirKylmruM3EGFeRr+HdjOPhQnwg+M+wM27KPGE7
 +N3AfnjlicQnMYYP4oO0gkkCpaBXQ4UcCItq6rK2agzhsIzo5X+hSD2itnCOI2aT01CETWlnW
 3Nttt+lW2cszTs8OmxRCMoWel4QoMw97+bCw1obXUSzf5tiQUsgWyw/VxU+pxbIXkZjHZp323
 kAlBNsl9jEOpC8acYxDv9jUTHGf0oEWxLc+y1M7bh5Fy8WHBJuE57jUV2SF/HZ3gIKtKyIWAH
 l8eErLlg3L8nGeUm+z+DuEEJbQOZbelFPzNFpxfsszrf/LfDr/fKW+7OU7e3ctjwltYatzjNy
 xxpeD1pFdzFSzeL0EPKj17WuKwSVvyqszuUO5vJfbgw/+6RuQ5Kg9prkbzBygBzMZkTOxIzqu
 M62nM1xiOPMkrSCi9LcCQFMbzOV6QK5GrgH178QeQZR14W3/XFcpiJ5PSz9IDbM6bVUNNGt+R
 u91lQK+jnkZaM5NXruphtdAAUE/QvOterGDYk62kfJEF5upj56s9a5XhKfqwm7j2Ca2iZDXK4
 i2zLJe/4TReb57ySE4qJO9AMHE8c/YHK9SNv8mRkjx4urganMKB3Qfs9DgO0wL/UAIzju9QYR
 Q5nimjcTQzEuHe3iEa6ZvC4+QfMRpUzOBvEHicxtSXCdgCJfbs98D4w0wZ4AHWL4sAokQn53j
 7uqOunDNg71WbCT9oAn3vc0nRisxZDASU+kYTADukwdLXmOfHmKpxsQ6LrK5xu72+STnTrUxK
 +AqqJYroEbObBItiIXO5vCLlBzX7qBlrEjfFf805gyiSMByKfVPDit/PFsSuMEKgxmHISQ6Rs
 41b3Th4m4yX2gRhcv+e2dB3ZZO5puwmmhPKLUkrPTb6MlXf4gri4iHsZB2We0gBN3o/lVPScv
 iZ708aOm79WJAwrd9
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have taken another look at the implementation of the function =E2=80=9Ce=
p93xx_keypad_probe=E2=80=9D.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/input/keyboard/ep93=
xx_keypad.c#L252
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/input/keyboard/ep93xx_keypad.c?id=3Df5e94d10e4c468357019e5c28d48499f=
677b284f#n252

 	keypad->irq =3D platform_get_irq(pdev, 0);
 	if (!keypad->irq) {
 		err =3D -ENXIO;
 		goto failed_free;
 	}


The software documentation is providing the following information
for the used programming interface.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/base/platform.c?id=3Df5e94d10e4c468357019e5c28d48499f677b284f#n221
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L20=
2

=E2=80=9C=E2=80=A6
 * Return: IRQ number on success, negative error number on failure.
=E2=80=A6=E2=80=9D

Would you like to reconsider the shown condition check?

Regards,
Markus

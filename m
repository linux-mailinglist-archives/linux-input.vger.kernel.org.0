Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 606961A424F
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 07:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDJFqO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 01:46:14 -0400
Received: from mout.web.de ([212.227.17.12]:58643 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgDJFqO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 01:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586497549;
        bh=wQZi1jYN0PwblJDRsNWeVp5mEL4bCN76eORdDMpxpKU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=LO8g6kQAzRndI9NHzALC+pdY0tcKChLFkdo7l/Y7JZeKs3qFtzopg2i0edjgNl3pY
         oi7AQgoY8tfyWD3800ngfjdQGiMRZK+4aLif6I8DiK0oNWn1foSFHrHh214PqYjZHL
         /cpMtGy5ExkQc51S3d+rALZ2zlkxz6lZw4nNWXzI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.110.107]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCqsR-1jWRXK18fT-009j5J; Fri, 10
 Apr 2020 07:45:49 +0200
Subject: Re: Input: ep93xx_keypad: Checking for a failed platform_get_irq()
 call in ep93xx_keypad_probe()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Arnd Bergmann <arnd@arndb.de>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Olof Johansson <olof@lixom.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
References: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
 <20200409204819.GR75430@dtor-ws>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <279dd87a-bbc4-685d-b557-7914e4132b15@web.de>
Date:   Fri, 10 Apr 2020 07:45:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409204819.GR75430@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:7tYjIm2pshBCa29VjlTdSvU5pYyQgsGM2gi6MjhAv42N0tkojqm
 BMYa/bdCW6UNxeqybZ9wz16HIhMyPWnA6X7e+6zMpF8OwTwWH27oyQvxRADCY2BXT3Xv8/v
 9mS7l9ywnLCZ7gCUcswRszERXi1iuv9yU2T0ln9s75iNfkAU34x3ha42NPk3C8dBDxuBM2s
 650hkKX4HKf69vd8W/pZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KxkKTFxAaqQ=:gq0AzYy1p7GHhfFjV8fvVS
 KuoS3bhcCAgwCgnl7BZNFrHBiqPBiLqu8onxXpiDOQZA9gGEEE1AvGuAdyNuKR5j/hG0od+xw
 TgdbmyvQi4MET8T+/IiOAsH4C0qRzpNXAKMBsUyopc5MugXS904Hwsyt9CyRRvWRIagcw2g5Z
 RXfmqEvXfVpAJvq5tuK/bOUFUv91nskNSleGkg4gZDJqBXWQV8wlkaIbMou6bol+bo24lcOkg
 iJ6aU2yg0O73SHZiucgPxFt91l9lV9tYlYBOsOWixKjmrpxfDz0d/MsdgLBiqjx47uBTvPCBk
 sfjLTUhiJ7PsCLgV3twSgbZ1DE0EsRTE4mSHY2hQ5qSMKiZJBxLuf4iimkAthMYWcYPdFHQ8P
 NPmAdd+zDjQFKEsCIEzwpU5PwOoM1ods3Aypwj0Wca8dSeAgXstU4DPauZFsTRZ0EDlbvNdDT
 0WvY00xTe3SnwBxrngl8h9kLFXFNSHiC6GWBc/an7vzU3TtYT2dbyyC4NIDiOFgLuRJw96rph
 5y/bSwYw91cR0BfzFq/RqyOi8YYQXnKKJDTgoAVLHsGFM8SqytRF5qh5/9c694tYV6k2qUyCw
 BfsWs12t5QRaVn/mYVag8+0GZ29Al+b1JJPs/bGTfzSYS23vkYW7efymIdu4dsVWmxiholLIB
 WNdueioqveRIbAjAMI3H3c3Mljr1TaTJAWqb5FKwOp0TPMDDJXzDJYBndhMmSpRkPeYRO6XbC
 WvZAQImA9xs2lfI7CNgEhLVmrJqMbLs3MnSY/RSaRAaiL4v5u/OjBVgWJLHPFVbOZhpFLNQ3c
 Fh8iiYwITqvplM+rPDbk3Xv5XbpGxFNQBZ8IDEimiNTv+36irvL75OGa9FyLV6JOcpnFD2lcE
 LjfPTPBvLvYdyUT/1kQDrPrggLz0JUHnrtubgNiJdauzCsO2GOUzAQe/pDIbseBTWL3KxNFAG
 hKC5GvuUkrqUSTL8xX5EJoWdBRu/2nFoJIYwNlhji3bBr/j38zzAEHfvqLX91A92f9nAt0Xol
 tW6Rr1VXefQqaAijU7UkA+4TqUdXvqD06yq5knvSUu5JPgOjLZ2QGXiGvdjUf1MwKB2JOfp3p
 WqIFhW9TowY2Gff6+0U7LWOya/EZNjjO/DhGnRl8QXzfbZEf8a3F1vH/z8+VaQSfS9PSg9SIT
 7ZuF9oBgPe3c2oPjTC2TU+c48Ky7oznKm7RfUOKVWNz9C83Dz85C91UVpv7caaMO3T4fflRja
 fgXcJeBSPxa+PkE6G
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Platform code historically allowed creating IRQ resources with IRQ
> number 0 to indicate "no interrupt assigned", so this driver tries to
> filter out such conditions. The negative IRQs (errors) will be rejected
> by request_irq() but I guess we can lose -EPROBE_DEFER.

Thanks for this explanation.

* Should such information be better represented in the description for
  these programming interfaces?

* Can the software documentation become clearer anyhow?


> or, maybe we should take a look at platform_get_irq() and see if we can
> stop it returning 0 interrupt numbers and clean up the drivers.

Will further collateral evolution become interesting?

Regards,
Markus

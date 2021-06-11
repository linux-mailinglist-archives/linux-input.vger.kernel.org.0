Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860863A4AC7
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 23:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFKVv7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 17:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhFKVv6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 17:51:58 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DBFC061574;
        Fri, 11 Jun 2021 14:50:00 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8B0368047F;
        Fri, 11 Jun 2021 23:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1623448196;
        bh=J1w1Qy+UZUBMOkVepzUoEUawid8tPfM8riAKr4+3hes=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kOfhTWKNaDLvYWOSRk0HwKPzXaTTm/qgE84IOw6w4DueqrI17o6U8z8Vp7csa0qvs
         VlA7aUY0tfosX4im3hXbtGrge+XzfhY9C31t4BsdFeutIe91PlKCXA7YkoddwvUg4f
         WsGkofi6CF5oDgZMo6zrstCNesofWdfkd5ZXx0Jr1A9NbHXy3wUQBq70pLH8oRo8c5
         hUBi2Ls06XeJ0GUG19FLeK2Jq5b+/Q3MklOXt85rHap7IN9FKjPTBCqQtpFJdhaXGQ
         ypKbjZpHlHeNxQWiXvQdtrpormvDVivTScvcoS2qFgYm2WILtjF2Fu0TC22aKfxbDs
         4Kujj0O3oFCfQ==
Subject: Re: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Joe Hung <joe_hung@ilitek.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
 <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
 <CAMuHMdXE0kipUm6wqHsrFurFkviU_nRJJB7cg6z1XwEvpEewGQ@mail.gmail.com>
 <YMOsRzfDnZ/iApwD@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <9d901eb1-6408-6b4f-1377-03c394d440c4@denx.de>
Date:   Fri, 11 Jun 2021 23:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMOsRzfDnZ/iApwD@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/11/21 8:32 PM, Dmitry Torokhov wrote:

Hi,

>>> On 6/11/21 3:54 PM, Geert Uytterhoeven wrote:
>>>> While Linux uses a different driver, the Ilitek
>>>> ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
>>>> binding documentation is very similar.
>>>>
>>>>     - Drop the fixed reg value, as some controllers use a different
>>>>       address,
>>>>     - Make reset-gpios optional, as it is not always wired.
>>>
>>> It looks like there are now two drivers for the same hardware,
>>> drivers/input/touchscreen/ili210x.c
>>> drivers/input/touchscreen/ilitek_ts_i2c.c
>>> The ilitek_ts_i2c (newer) seems to be derived from the ilitek example
>>> code / driver, while the ili210x was written from scratch as far as I
>>> can tell.
>>
>> I'm not so sure they're for the same hardware, but you may know better?
>> https://www.displayvisions.us/fileadmin/html-seiten/eng/pdf/zubehoer/ILITek_TP_Programming_Guide_V1.50.pdf
>> lists only Ilitek parts handled by ilitek_ts_i2c.c.
> 
> Ilitek folks said that the new driver is for their "Lego" series
> controllers, whereas ili210x.c is for older hardware.

The older driver also supports 251x . What exactly is "Lego" series ?
In fact, is there documentation for the different ILI2xxx touchscreen 
controllers ? So far, all the information I had was pulled from the 
various forks of downstream example code.

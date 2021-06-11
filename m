Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF663A43F3
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 16:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhFKOWh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 10:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhFKOWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 10:22:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7D6C061574;
        Fri, 11 Jun 2021 07:20:38 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 99EBA801DE;
        Fri, 11 Jun 2021 16:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1623421235;
        bh=Tzh7KahU0XoqqYoKIqzCwB0di8bH65dp33p+SPOKOYA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YuhWjZRDGTt6LXgtK2SWj6D1AE+JtFnEqFdzQ6fbtifVvzKZhC8pLNXDtVdDyTtn6
         WzDiaKGUs1eBP+Yf/u7klEZvsuSyhcxRqa4+YicNhwhfOZwSOL/RckXO4zU77nlgz/
         iRcbKpmLjgueZg5hGuBT8g2CPeY0F4sw7zPw4DUA94QvhWbjJUgmluxHm8HH4FLfbJ
         yTNJVdLUjk/f2vHcnuLU8ctggjslL4V707ZwgzeBRGG68k6xFET4t5HPsfDOv2WzqB
         2fg4/U8TYW4T0G1OEo3sSkWovXkzhqprO4DdSKHgD9bVSVny0BU7adqSTCjsQP+gt6
         YlUM4tPGDwCHQ==
Subject: Re: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joe Hung <joe_hung@ilitek.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
From:   Marek Vasut <marex@denx.de>
Message-ID: <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
Date:   Fri, 11 Jun 2021 16:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/11/21 3:54 PM, Geert Uytterhoeven wrote:
> While Linux uses a different driver, the Ilitek
> ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
> binding documentation is very similar.
> 
>    - Drop the fixed reg value, as some controllers use a different
>      address,
>    - Make reset-gpios optional, as it is not always wired.

It looks like there are now two drivers for the same hardware,
drivers/input/touchscreen/ili210x.c
drivers/input/touchscreen/ilitek_ts_i2c.c
The ilitek_ts_i2c (newer) seems to be derived from the ilitek example 
code / driver, while the ili210x was written from scratch as far as I 
can tell.

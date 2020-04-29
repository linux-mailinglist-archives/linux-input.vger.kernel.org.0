Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010451BD2CD
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 05:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgD2DLZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 23:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726560AbgD2DLZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 23:11:25 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2682CC03C1AC;
        Tue, 28 Apr 2020 20:11:24 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id t3so671392qkg.1;
        Tue, 28 Apr 2020 20:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WHs8ke0Gw6reMmvCug3kjBIZJVJKpowZ4GplwPiaIKE=;
        b=HBr/3T3/qr8Lb5BjyMhrk+TlrezveYN/pw/zLUP/qU40wc0j+wwcDjuYK/djjlrVAM
         Cr+xsMNhaYTg16d3jxjMkJFABchp3GLoW+wam4I4azuIpfrLPzEbiWo8rTlKnHK4b4fH
         4O2XoKcgG2cNBZAzvafit2QUrwRY7w4RamZOW6UYMMWAO/pmS2II7gP0N2qVVhAfXb+u
         PFS9YXUzpcMPm8fHegf/hQ2Rd82XCi5ywPaQEAW0hTUqnS8Q9wjEzODiDGqW1wZ1Akgg
         APFwqigzOW4QSGXceNyVxRNFlUVzth4BvZ8HfGDU5b4YpT0FIisu5d2LD9kqO8BarFUj
         9nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WHs8ke0Gw6reMmvCug3kjBIZJVJKpowZ4GplwPiaIKE=;
        b=MHcj++KBtpWKSdyxpJcsApbQDvQNqHIsUY11zvKaNclckCwOhsb3u5ytPAJdf7ab8s
         y4xw6l6mpVw/LTy504CB0jbv3azFnmhj2vy0qi3WBlBAsHBMzuHKBI6tHwwIIR7Spf/o
         jo0D8BEeXx3hvN6x3SN4ip2VK1KDwK9WDd/5GxI20PyDn8yBAEUBcQ7N08af7LQvRdCF
         RPb5ML0H5zuQafqtsrZsW+MMWeJDdgcfzvQoXnrR7Bv50+Mz5wjSCBETa47+FodlSoA6
         Z8yi6h4X6y7sDcohui+1dT7YHfR+Yy1jCc1NZq2Te+kSw2ifez8I361/WEUk9MFdevMR
         UuyA==
X-Gm-Message-State: AGi0PuYzsjIe8uL+wmdy3K4Js1VqOSEEvG7eBgG6+zNZWefZvjRuAy6y
        i9YnkBjPI+3oNvk70Up24ip43ZmU5HOiVP5ZuEY=
X-Google-Smtp-Source: APiQypI4xhhlfLjlXDG+gMyTnHgQTNH5cxHxffOo30wBCDqwcLfDGiEI3OXGGGAp31UHp7eQPpOYxnbS37451I2jAoQ=
X-Received: by 2002:ae9:ed89:: with SMTP id c131mr28608732qkg.447.1588129883206;
 Tue, 28 Apr 2020 20:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200428213035.3108649-1-arnd@arndb.de>
In-Reply-To: <20200428213035.3108649-1-arnd@arndb.de>
From:   rishi gupta <gupt21@gmail.com>
Date:   Wed, 29 Apr 2020 08:41:12 +0530
Message-ID: <CALUj-gse+6=pTooNAo4=QjM+YXTmTd_O826v7pW6WbbXFDuXLg@mail.gmail.com>
Subject: Re: [PATCH] HID: mcp2221: add gpiolib dependency
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Bastien Nocera <bnocera@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Arnd, How about one liner:
depends on USB_HID && I2C && GPIOLIB

Reviewed-by: Rishi Gupta <gupt21@gmail.com>


On Wed, Apr 29, 2020 at 3:00 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Without gpiolib, this driver fails to link:
>
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp2221_probe':
> hid-mcp2221.c:(.text+0x1b0): undefined reference to `devm_gpiochip_add_data'
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp_gpio_get':
> hid-mcp2221.c:(.text+0x30c): undefined reference to `gpiochip_get_data'
>
> Fixes: 328de1c519c5 ("HID: mcp2221: add GPIO functionality support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hid/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 008bf44bc2c3..d54e7ae80de5 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1155,6 +1155,7 @@ config HID_ALPS
>  config HID_MCP2221
>         tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
>         depends on USB_HID && I2C
> +       depends on GPIOLIB
>         ---help---
>         Provides I2C and SMBUS host adapter functionality over USB-HID
>         through MCP2221 device.
> --
> 2.26.0
>

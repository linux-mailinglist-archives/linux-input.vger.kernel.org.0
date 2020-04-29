Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA3C1BDBFA
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 14:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgD2MWW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Apr 2020 08:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726524AbgD2MWV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Apr 2020 08:22:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C679DC03C1AD
        for <linux-input@vger.kernel.org>; Wed, 29 Apr 2020 05:22:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l19so2344412lje.10
        for <linux-input@vger.kernel.org>; Wed, 29 Apr 2020 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=At5ArdEmNIKZnLbAQqmTh2Ohaa/8dGvC7QareFwEvY8=;
        b=MQS7n5nuZTWdcxXIV56plb9rF9f9lngEzjbv7WBiph/u9R2qkYx1KF8S/g2cSwvu3M
         B1nfcxz4/AlJWpMA5qTadMjqffbfz+Bxf3wDWQI0w9HvczmgFRyaf/qchZWmoMSHOozQ
         ixF+dOQmdcUgICh15t1g4qQ+kCFbdgR0VUuZXUj6vbrAfD3Lot9Fd68x5HA+WSSGfGlR
         1V/3K0pyTixPGvePUXT1RbEUowyDiT+VFIKnvBmriwNYyfr5sLXfQYNLQahgyiRI7b3W
         c9jAyCenWXVZ+0dSZ4GG7YlHS9nkOP2NJZS35BOF6ZmX2CFGTMb5h+hzhvQlJD2AK5Fi
         dVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=At5ArdEmNIKZnLbAQqmTh2Ohaa/8dGvC7QareFwEvY8=;
        b=rlTpiSEoWbMw1p3TyjSBuuceaMhkXAGFok+faVqG1pPD43ZiFbL85zgnDPVuRHdP8c
         2Vvb7yQ+B39FdAy6vvhuT+/MEGSqQ7NlPO8vBJZuxBavieWBoVdssrnqjCSnQ3d43zJm
         dsYPoZEme9w9TlPqD2XWG6TLFlBEGBnMGkxbenjwSLlVEldeSxYrWlppeHZRwwDIar/M
         aTTL4OqdVTrn8umQTkkRgHEjGeEacyurNaB6x4AouDMIg06S0P3wHiUBb+YEb4bYKsxl
         D2AgiDCxS645iKOA9ZtmLVe02920Bg6ZRbqvaZuhe1y7+HRVrNHyniE9hUqo08LfhS2S
         IZDw==
X-Gm-Message-State: AGi0PuYS6xXbvYt5P31Gdr7s5FTRpiZRyHpTmejmV83QUzvp4GIE/P9I
        yd67BZkhJLQuAGpTebgE0Xf2cONMVtoWbogpM8eX/A==
X-Google-Smtp-Source: APiQypIczOCMTP+eucvr3s4LVVfkVX9Na79HgVpaZC6m5PHomFMH3wc8ZCLx1Mc8QyfmmC2U1yOL1Hu7gzWAaAaX/gE=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr19238440ljg.99.1588162939136;
 Wed, 29 Apr 2020 05:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200428213035.3108649-1-arnd@arndb.de>
In-Reply-To: <20200428213035.3108649-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:22:08 +0200
Message-ID: <CACRpkdbfWvgDXEcsubYcEZ9hV+2xxK48fK06-OVJ-hcFUDgouA@mail.gmail.com>
Subject: Re: [PATCH] HID: mcp2221: add gpiolib dependency
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jkosina@suse.cz>,
        Bastien Nocera <bnocera@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 28, 2020 at 11:30 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Without gpiolib, this driver fails to link:
>
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp2221_probe':
> hid-mcp2221.c:(.text+0x1b0): undefined reference to `devm_gpiochip_add_data'
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp_gpio_get':
> hid-mcp2221.c:(.text+0x30c): undefined reference to `gpiochip_get_data'
>
> Fixes: 328de1c519c5 ("HID: mcp2221: add GPIO functionality support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

>  config HID_MCP2221
>         tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
>         depends on USB_HID && I2C
> +       depends on GPIOLIB

These days we can even do select GPIOLIB, but I suppose
that would make the driver selectable on platforms with no
native GPIO support at all (like UM) so I suppose this
is better.

Yours,
Linus Walleij

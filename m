Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA002C87F4
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 14:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfJBMH1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 08:07:27 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46547 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfJBMH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 08:07:27 -0400
Received: by mail-qt1-f195.google.com with SMTP id u22so25918042qtq.13;
        Wed, 02 Oct 2019 05:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ex6/oNwBMHfkrNehPUjGFzRyUvsWT0jO6XWSq6yiKHU=;
        b=blLIkbkJS1wd1VJoOY+NYTDPa4rP3aELNg7nAbLLtgA09PDdZdz6JFkaMA19Z40vVy
         csnme0aIF4TJcOqty6IvdBTOSswNzHT0wJHDxVVOqw5jZBhwVPJFW3Jk537WzEKPaCWW
         uhJdJ4gg1F5MIZnthRkbilStw4XBj/MmgGA4EWkb0HydsyXiN9BuLHdXryBplTrNTdj7
         jOUA98/nRf2faOlAmUW5pmfxqA5e5ppxMzEM24LdENMjRk3wzO8Bqa+4CbNqUHKGgPIE
         NQj6A+LiAh57JaorDt5RbYehTF6RRt1geU3hosMgDZ9L+mJJV1ikNJ27YK3hSbdX0v5y
         0v6A==
X-Gm-Message-State: APjAAAUXFsQCQ6MH77zi9k3XMx1vPuUYpm8bBzIw2prAoKMna8pEXPU4
        mSamnUhf+AV/1vJ2c1fbLHZ4oskoMkJ89tvrOF0=
X-Google-Smtp-Source: APXvYqzDip6r97ouSV9gLUoJm4dYFmol3Z3MKhIpWC/42PDoJ1Dtw5g0nyG5uRgmTPJa49nIfbTBt3XARkRdXEy+TrM=
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr2662220qvv.45.1570018046381;
 Wed, 02 Oct 2019 05:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191002095736.1297224-1-arnd@arndb.de>
In-Reply-To: <20191002095736.1297224-1-arnd@arndb.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 2 Oct 2019 14:07:09 +0200
Message-ID: <CAK8P3a2=V4qJ9CDzZMNCzgOh-nD-24AFdoo83+QRNfc60FxD4Q@mail.gmail.com>
Subject: Re: [PATCH] input: ixp4xx-beeper: include linux/io.h
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Enrico Weigelt <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 2, 2019 at 11:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> asm/io.h may not be included implicitly, causing a rare
> randconfig build error:
>
> drivers/input/misc/ixp4xx-beeper.c:48:3: error: implicit declaration of function '__raw_writel' [-Werror,-Wimplicit-function-declaration]
>                 __raw_writel((count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE,
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Please ignore, this does not apply to mainline and is probably only needed
on top of another patch that I will submit in the future.

       Arnd

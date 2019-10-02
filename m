Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25306C87AB
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfJBMA1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 08:00:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42865 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfJBMA1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 08:00:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id c195so12516904lfg.9
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2019 05:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+sr94GOz0pdmFe8NPbOwLVU6p5EmhKwRfQwRJfRbnBs=;
        b=XYZZEpu74MT695K5Dhx/fEcUDe2G2eFTqT0vM+pZl4strKcLUGQ3PO4W5WWSVxueYL
         xelWz1hdlNawP22kgoRzj9+gri56rn4GqB2BzyyFyBo5wmMyFhTEsnWIpHJVg71Doawi
         X0UmzJ2Mg0sZHfbZGLjudQI7fiLTABciu0ckx66x6R7xiSKCO5fuWaMSTUW6PrAiHtWA
         qXsW2TsXsD+iH8Fe4lJWM9gQlkWrJ1YM3T7Hk3eA/l1lBEhX0turashSToMDo+qTRV0j
         EArNvVqF48LbX/WbJ3DoCu+mQYUp8glmcRPEUmIZi/vxLDpk2ipehTRQqN0ofY+uL0bj
         Kp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+sr94GOz0pdmFe8NPbOwLVU6p5EmhKwRfQwRJfRbnBs=;
        b=KbYPeEM35GO4k/YpcxDAdVtonOKZEGDyhlhfyDsqOV/9MWtlXSBwN6qCFim9IbBubr
         6qZJmsJjnZVJzy1ReQ26PVCk0T6YJf0JvRgRLCv5gd2+2+gXJieBHUiaMX7+Ov3IStJP
         tE4F4vh8H++gGjXY9QtlsoHWoE23ib2+nNnJsDstB/5snwf9xM4Sfr7pNn2AXXjMP8J2
         0FEGWVEf8TUmNZCsqxhNVQl6Wb2q+4a5gs3bv+d5SLo+oiz5vktKUm3d2KYgU6BjBah4
         ukNkFT0syFjBWMAMux3IVfYiUy60gx44xNgghoJZKeR6dhvzYBmdxPXOyET90M9A8WxC
         jWlg==
X-Gm-Message-State: APjAAAUpbt/4SEzmmUVoi14HHUROKBsGpcz0+lYH3pP4eBSJ/qr0uOlv
        T4PyTTDhToXBLB8ZOW5mglRNtFnJMdzj5Y1ZJLm0/84Th1c=
X-Google-Smtp-Source: APXvYqws7AaUk10K3J+WGNGa9aG6oOMKe/16UpknoRlkcmS+/JnmqWIQR5M1h0Xl7NN+bsfT58Bw3Xn6VFU0J6Gbf1k=
X-Received: by 2002:a19:14f:: with SMTP id 76mr2052115lfb.92.1570017625360;
 Wed, 02 Oct 2019 05:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191002095736.1297224-1-arnd@arndb.de>
In-Reply-To: <20191002095736.1297224-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 2 Oct 2019 14:00:14 +0200
Message-ID: <CACRpkdaVhhGF-g_95zPg2wvXGcGfYG1YUVVuz5nOsRw8GwGQkw@mail.gmail.com>
Subject: Re: [PATCH] input: ixp4xx-beeper: include linux/io.h
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enrico Weigelt <info@metux.net>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 2, 2019 at 11:57 AM Arnd Bergmann <arnd@arndb.de> wrote:

> asm/io.h may not be included implicitly, causing a rare
> randconfig build error:
>
> drivers/input/misc/ixp4xx-beeper.c:48:3: error: implicit declaration of function '__raw_writel' [-Werror,-Wimplicit-function-declaration]
>                 __raw_writel((count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE,
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am thinking a bit about the future of this driver. Isn't it more
reasonable to just make a hrtimer-driven PWM and use the existing
PWM userspace ABI and timer framework in Linux for this?
Not that there is a generic timer-driven PWM but ... that is
essentially what this driver is.

Yours,
Linus Walleij

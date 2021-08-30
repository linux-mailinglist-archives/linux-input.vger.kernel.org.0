Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DED3FB6A0
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 15:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhH3NBh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 09:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52479 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229809AbhH3NBf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 09:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630328441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1QISg/NYFf78v9zEJ28Xkat7ENRrNVQvUvLwRsOOvUY=;
        b=XXtYpWdCpjnkE8p7imMPxR66oVsjO1m3y9ngha9A56D4DFMKUJ4jgxhXA2UyQWN0Uu6Vhj
        B2+czeQq4w8CXiMtAFT265NxNUwORoLyxA5Lef+mS8rTkBYe+3rHUDBvZWd0nZGP5FJ3tz
        hb92IIc3GTkLiFN+bOsfQvHba+2woRU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-uya4Neq-OPa6phoNDjRQTA-1; Mon, 30 Aug 2021 09:00:33 -0400
X-MC-Unique: uya4Neq-OPa6phoNDjRQTA-1
Received: by mail-wm1-f71.google.com with SMTP id k5-20020a7bc3050000b02901e081f69d80so4675227wmj.8
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 06:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1QISg/NYFf78v9zEJ28Xkat7ENRrNVQvUvLwRsOOvUY=;
        b=N9Wfx9OInnGKhAZYiHZwSpOpG8/DEoGuuQA8l0nXw23VuAD+WWnbCm59tY9p33VQwB
         yX+aFbdM8IveX/Xa23y3pD+Ft4UA04cHMKilPexb64H63NaSZhAqa0+k9yrDqVSCJxlF
         rHk7m1c3GQYeWiTEKQ55+FK8gpgn9zS8etdWmnYhzbUAY7dj1Pp5MID/hS8wS1+FZG6t
         gEsjHbwoJt22ugDU+Icis7l3ILLidbGqTLK4iDxiGDpU+pfUhebBe1A1WvU8rlg4yw+U
         +ZZgn+zqB7oWFbaZFZKppqktFl8lDG35AVxBm8LJviRGv6pp8vaHi43uOGuhc1s0oXJ5
         UoFA==
X-Gm-Message-State: AOAM53026QM7vsXPjeQBKiDCJt1bGikhRvCD4Js7Iu4aY35rs2t45KF/
        cn/c6v+aNeKLKtneI87Zk+XJCAe0lqe9gcctNdvF4F5xObTfDJTJnOQnU8mlWfaYjN1SmSdj909
        kZexUvfbwwgGtguHS0dQB9zI=
X-Received: by 2002:adf:c785:: with SMTP id l5mr26059306wrg.360.1630328428630;
        Mon, 30 Aug 2021 06:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyeAnddxexwyxt1smSb+6mGbFViWKJvMPrKjdmL3RSq68uOI2M94yMRhQNQnLliA2dnz6zTA==
X-Received: by 2002:adf:c785:: with SMTP id l5mr26059292wrg.360.1630328428469;
        Mon, 30 Aug 2021 06:00:28 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3c08:b500:afb2:5ebc:3fd2:26de? ([2a0c:5a80:3c08:b500:afb2:5ebc:3fd2:26de])
        by smtp.gmail.com with ESMTPSA id c14sm15263203wrr.58.2021.08.30.06.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 06:00:28 -0700 (PDT)
Message-ID: <72210d6eb3e50254f0808a8040bd4bcd471cc87e.camel@redhat.com>
Subject: Re: [RFC PATCH vs 2/4] drivers/input/joystick: sensehat: Raspberry
 Pi Sense HAT joystick driver
From:   nsaenzju@redhat.com
To:     Charles Mirabile <cmirabil@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
Date:   Mon, 30 Aug 2021 15:00:26 +0200
In-Reply-To: <20210820180801.561119-3-cmirabil@redhat.com>
References: <20210820180801.561119-1-cmirabil@redhat.com>
         <20210820180801.561119-3-cmirabil@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-08-20 at 14:07 -0400, Charles Mirabile wrote:
> This patch implements support for the joystick.
> It supports left/right/up/down/enter attached via i2c
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>  drivers/input/joystick/Kconfig             |   8 ++
>  drivers/input/joystick/Makefile            |   1 +
>  drivers/input/joystick/sensehat-joystick.c | 124 +++++++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 drivers/input/joystick/sensehat-joystick.c
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 3b23078bc7b5..d2f78353b74c 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -399,4 +399,12 @@ config JOYSTICK_N64
>  	  Say Y here if you want enable support for the four
>  	  built-in controller ports on the Nintendo 64 console.
>  
> +config JOYSTICK_SENSEHAT
> +	tristate "Raspberry Pi Sense HAT joystick"
> +	depends on GPIOLIB && INPUT
> +	select MFD_SENSEHAT_CORE
> +
> +	help
> +	  This is the joystick driver for the Raspberry Pi Sense HAT
> +
>  endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 5174b8aba2dd..39c8b5c6e5ae 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
>  obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
> +obj-$(CONFIG_JOYSTICK_SENSEHAT)         += sensehat-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
>  obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
> diff --git a/drivers/input/joystick/sensehat-joystick.c b/drivers/input/joystick/sensehat-joystick.c
> new file mode 100644
> index 000000000000..4aca125bc29d
> --- /dev/null
> +++ b/drivers/input/joystick/sensehat-joystick.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Raspberry Pi Sense HAT joystick driver
> + * http://raspberrypi.org
> + *
> + * Copyright (C) 2015 Raspberry Pi
> + * Copyright (C) 2021 Charles Mirabile, Mwesigwa Guma, Joel Savitz
> + *
> + * Original Author: Serge Schneider
> + * Revised for upstream Linux by: Charles Mirabile, Mwesigwa Guma, Joel Savitz
> + */
> +
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/mfd/sensehat.h>
> +
> +static unsigned char keymap[] = {KEY_DOWN, KEY_RIGHT, KEY_UP, KEY_ENTER, KEY_LEFT,};

I'm not sure devices outputing KEY_* events fits input/joystick. Maybe
input/misc or input/keyboard? Or else use 'BTN_DPAD_UP/DOWN/LEFT/RIGHT'. Which
is what game controllers seem to do.

Regards,
Nicolas



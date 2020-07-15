Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5128922172F
	for <lists+linux-input@lfdr.de>; Wed, 15 Jul 2020 23:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGOVnO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jul 2020 17:43:14 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41889 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOVnN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jul 2020 17:43:13 -0400
Received: by mail-il1-f196.google.com with SMTP id q3so3310144ilt.8;
        Wed, 15 Jul 2020 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tbIDFcHm1gJrq8IL60XYYyLS9ocwAGiExcbwkE9vsSc=;
        b=Q6Ndhkwk1ZPVIHUoB+DPga0k5bx0jL6mZIcOqEhsTK3Sv3MU9xsuzlrPh7urPMzmP6
         eQlH4oz4q6YMjuz76bScq4LFVqWylxeu7MbCIxtIPjyOGfw8hk/VmNfujXzSUnPEO0Vs
         jhnqKPwvxNaOk47sJ0+uZVXHyiBnrfFQX1X/eDYEz2F6lIChZvdvz80j0SADJNerpQww
         mxC71iShcdgW9yaH1l1czzXxuckDmwEkahXxLC5DaB57uq4xTuGuPBqDDOg3eu1FBcTG
         fyNyJFxkZcKMljAhvCQjZ7KG44fTQ8xFjFxj7EQ5P7wlS8ah0o5+F/z8wvUrsKtOIh4U
         pD/Q==
X-Gm-Message-State: AOAM5324FdrR2Bny16d38IqPy2+aYEIGICkyXlFbTAxRyoMDJ5QIyVCj
        tVqGxm+mY56YLjZloP15dw==
X-Google-Smtp-Source: ABdhPJwDWgt7AyBWgVYwGzr6f6IRjKHR0z+ihwn7xVJE3HrZGHe+RXzfDt4wHqQw7V+FjMdopXtxQA==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr1503938ilf.186.1594849391997;
        Wed, 15 Jul 2020 14:43:11 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w82sm1723815ili.42.2020.07.15.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 14:43:11 -0700 (PDT)
Received: (nullmailer pid 867523 invoked by uid 1000);
        Wed, 15 Jul 2020 21:43:09 -0000
Date:   Wed, 15 Jul 2020 15:43:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     ben.dooks@codethink.co.uk, swboyd@chromium.org, arnd@arndb.de,
        megous@megous.com, linux-input@vger.kernel.org,
        rydberg@bitmath.org, m.felsch@pengutronix.de,
        Henk.Vergonet@gmail.com, linux-kernel@vger.kernel.org,
        ronald@innovation.ch, lee.jones@linaro.org, Anson.Huang@nxp.com,
        corbet@lwn.net, christophe.jaillet@wanadoo.fr,
        marcus.folkesson@gmail.com, p.zabel@pengutronix.de,
        luzmaximilian@gmail.com, robh+dt@kernel.org,
        linux-doc@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mylene.josserand@bootlin.com, usbb2k-api-dev@nongnu.org,
        oneukum@suse.com, linus.walleij@linaro.org, jeff@labundy.com,
        masneyb@onstation.org, james.hilliard1@gmail.com,
        devicetree@vger.kernel.org, a.fatoum@pengutronix.de,
        krzk@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: input drivers
Message-ID: <20200715214309.GA867493@bogus>
References: <20200705074959.22533-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705074959.22533-1-grandmaster@al2klimov.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 05 Jul 2020 09:49:59 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See https://lkml.org/lkml/2020/6/26/837
> 
>  .../devicetree/bindings/input/ps2keyb-mouse-apbps2.txt        | 2 +-
>  .../devicetree/bindings/input/rmi4/rmi_2d_sensor.txt          | 2 +-
>  Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt      | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv260x.txt        | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv2665.txt        | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv2667.txt        | 2 +-
>  Documentation/input/devices/appletouch.rst                    | 2 +-
>  Documentation/input/devices/bcm5974.rst                       | 4 ++--
>  Documentation/input/devices/iforce-protocol.rst               | 2 +-
>  Documentation/input/devices/joystick-parport.rst              | 2 +-
>  Documentation/input/devices/ntrig.rst                         | 2 +-
>  Documentation/input/devices/pxrc.rst                          | 2 +-
>  Documentation/input/multi-touch-protocol.rst                  | 2 +-
>  drivers/input/keyboard/Kconfig                                | 2 +-
>  drivers/input/keyboard/lkkbd.c                                | 2 +-
>  drivers/input/keyboard/opencores-kbd.c                        | 2 +-
>  drivers/input/keyboard/tca8418_keypad.c                       | 2 +-
>  drivers/input/misc/Kconfig                                    | 2 +-
>  drivers/input/misc/cm109.c                                    | 2 +-
>  drivers/input/misc/gpio_decoder.c                             | 2 +-
>  drivers/input/misc/palmas-pwrbutton.c                         | 2 +-
>  drivers/input/misc/powermate.c                                | 2 +-
>  drivers/input/misc/tps65218-pwrbutton.c                       | 2 +-
>  drivers/input/misc/yealink.c                                  | 2 +-
>  drivers/input/mouse/vsxxxaa.c                                 | 2 +-
>  drivers/input/serio/apbps2.c                                  | 2 +-
>  drivers/input/touchscreen/edt-ft5x06.c                        | 2 +-
>  drivers/input/touchscreen/iqs5xx.c                            | 2 +-
>  drivers/input/touchscreen/mc13783_ts.c                        | 2 +-
>  drivers/input/touchscreen/ti_am335x_tsc.c                     | 2 +-
>  drivers/input/touchscreen/usbtouchscreen.c                    | 2 +-
>  include/uapi/linux/input-event-codes.h                        | 2 +-
>  32 files changed, 33 insertions(+), 33 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

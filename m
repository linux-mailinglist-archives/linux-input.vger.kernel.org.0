Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB29139B0B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 22:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgAMVCO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 16:02:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33797 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAMVCO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 16:02:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so8002019lfc.1
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xCGbHvNw8rM1XTYX5dMZZI/XcJg6Z8xTEJgG0KaNE6Q=;
        b=WfoTzIcApqDnmbglxDY/A1UCBtcumVTAQtuvp5lA7Py3eVEYXLAcKBSNS3JQbVEiLz
         Ea9eYCdHy9boMFNN+mSL4Cv/4/npr0DjEVJxbtnQCLMPb/Vtp4z40GTgfGZwcdXWIFOP
         P6fAO91/NJvtV3jpVkQlfUB1u7ToESlQgTAKsIQp8iF5dCniHybouIcJTeBH+sgav3xB
         hUwX7z0WEiruc6Yt3a6kYc48Yn/FuThb1rBp1rdxahWC51mg2Zk7fMyIgBfTMMJugotR
         aEeu4LpTrUv3kO5plLRLUPCqX0f/fCQgRcR8qx64mZiu6Idr3ufUqrgC5vCwzBLuwmHx
         kiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xCGbHvNw8rM1XTYX5dMZZI/XcJg6Z8xTEJgG0KaNE6Q=;
        b=WcDIef2UMNqF3+155gbWljVK4feGvs/WpO2OB8MMTkqeUjy5ydDRFvVMcVxKhwV30a
         2fGFQm4n3wH+/O5Fq5CB2EFm0XpB2JSMzcZrWQ3RxQSNkiFIaUgC+YRDsDSrwblQ/YPr
         z4r8NIUBtMq/78MeDlkPkmzWUgDuXNl07r0NXAiwWfi6gnnRFcmG1X5NpjCcwqimRX++
         //gSBe4pEf79SNse2qXY3ErFqYc9fGREiRCwycCpWtsQUyDXyNOJmScWHksp8xnVOrhM
         bDwEL8NHLGjfDACbEVbcWt2jzUhx7O9MGy/SVHvOvq6f7UDVhptVTeKj3kwCf7Y/L3Pb
         2U9w==
X-Gm-Message-State: APjAAAWHWx9KhoAHV9fh5GHVWYhaZ9+H7jYJMkePcVlEP9lhznDF4+P4
        i8qVXYFRDfQBwAedvHNSY8ZpPAn8F+1spssDIIELVw==
X-Google-Smtp-Source: APXvYqxazGXvDPrS2GaH8GISFT7UvjIUyPI46aCJE43N7AU2npOr36/CMGu5DgUYNLpHNXpBqDmkDCDtW0exQA7M7YA=
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr10486729lfq.176.1578949332089;
 Mon, 13 Jan 2020 13:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20200112111341.21388-1-linus.walleij@linaro.org>
 <20200112111341.21388-2-linus.walleij@linaro.org> <20200112165404.GA72221@gerhold.net>
In-Reply-To: <20200112165404.GA72221@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jan 2020 22:02:00 +0100
Message-ID: <CACRpkdbDEhCu8LVBT_xjuar1UgCPALJg0V12varZjG-eGqj=2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] iio: light: Add a driver for Sharp GP2AP002x00F
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linux Input <linux-input@vger.kernel.org>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 12, 2020 at 5:54 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> It seems to work fine on samsung,golden with gp2ap002s00f.
> There are interrupts being sent when something moves in front of the
> sensor and iio-event-monitor looks good too:
>
> Tested-by: Stephan Gerhold <stephan@gerhold.net>

Thanks! I think I'm up at v7 or something on this driver
and now it looks good.

> Out of curiosity: I'm not so familiar with the IIO subsystem,
> is it intended that the sensor is active the whole time?
> Wouldn't it be better to activate it only when something is reading
> /dev/iio:device2?

IMO the best way to power manage an IIO sensor is like I do in
drivers/iio/gyro/mpu3050-core.c

Of course I think it is excellent code since I wrote it. Beware
of hubris in the driver.

The idea is to take the runtime pm handle on the device
whenever in use (reading values from the hardware or
using the trigger), and then use autosuspend to completely
shut it down (including regulators) when not in use. If the power-up
time for the sensor is long, then the autosuspend timeout
should be proportionally longer, like a magnitude or two above.

With the proximity events I have this problem that I don't know
in the driver if someone had opened the file to read events
or not, only the core knows, I think. I just emit my events
and be happy.

Jonathan: is there a way for the driver to know if someone
is listening on the event interface?

> There is one problem I noticed, although I'm not sure if it is a problem
> in this driver. Reading one of the files in the sysfs results in:
>
> $ cat /sys/bus/iio/devices/iio\:device2/events/in_proximity_thresh_either_en
> Segmentation fault

That looks like an ordinary bug, but that seems to be for the
core? Hm...

Yours,
Linus Walleij

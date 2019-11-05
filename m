Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0449FF0176
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 16:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389359AbfKEPaG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 10:30:06 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38418 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389940AbfKEPaF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 10:30:05 -0500
Received: by mail-oi1-f193.google.com with SMTP id v186so17882835oie.5;
        Tue, 05 Nov 2019 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zOZaNvq7F7dJwKU0/lAjWcMofIFKUKvDoZCseAjXXec=;
        b=AueMTVcYoCo1Emd66kHImeK0kPJvnLvmWEsuDYd6nuFLH0oSNpsItRxMldEAlEaw5Y
         1SKyjxY6rvb1TpsZCWCfOdXDIWa8Y2ueETUR3PVGH5tufV6sivD/GPp3cDP88cnm2TVg
         5AJTK8uCLEYkMkspsB3jnKJua06i14BB3w2UqQQHOE82HvqT3fA3KiKw4v/+02CkfhvL
         c4JqNtX7GoViL5ee3bxCScghE6Mo3AJ1YuR2NhcQQxSJGTlznFNtXQGoY1fgTQxNRwKe
         BDbJrU3dkq9rw1s03PS000WAQyIXjBNCnW3P/t7mQ5FoV13vhNS1c6SVqzWdOW2h34hy
         VOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zOZaNvq7F7dJwKU0/lAjWcMofIFKUKvDoZCseAjXXec=;
        b=BCqcAhAv58a08xKTUgIRXJj83GCeqcR690BoDg5FtWTDOtYfb8r5anj75qv6Vj//lN
         RbGAuK84XjXrA6qVTTCjmK0ALI4bHYK6BymKVGSI3WCKrAs1J+m8DhK6QRSYrMm/KRrn
         TRSfXQLrVgqipQmhDAaZBii+T8gvnUDwd55wpn5JHBAJQtZsjfuvi/u3HROyls/JxjH9
         E8N5ozUj7osYbKG+GI7nRrxO2Cp3u2vFl3OBil+YoIb+sZT7LapVsEgJkGXMS5EHbyyU
         oHF6yDtBkoKFYdaQo09C/q+rpeZRaYubtVWxDwxdT3KX9hTBy5eKQ/wjNNASf0sXctnF
         3BMg==
X-Gm-Message-State: APjAAAUge0SCv/zKdrF9rGXKDowyYrzNzUKRpKb3wCqeBHqnkL49Uaf9
        VL3I2m9/wGNFohnqxork2v2v3nwjWQXARp365g/CDjpr
X-Google-Smtp-Source: APXvYqw3fvx8K9H3ev+WriFrYdJ9nXETfRK7hZeP2A8yk/QYSNp2tuDyWVKQ+Xo9i1H2TuwfqRFAYSY802MbDEw3VkI=
X-Received: by 2002:aca:d4c4:: with SMTP id l187mr4290694oig.169.1572967804201;
 Tue, 05 Nov 2019 07:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com> <20191104233621.GP57214@dtor-ws>
In-Reply-To: <20191104233621.GP57214@dtor-ws>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 5 Nov 2019 10:29:53 -0500
Message-ID: <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 6:36 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> OK, I refreshed the branch with fixes and a couple of new patches. It is
> on top of 5.3 now. If this works for you guys I will be merging it for
> 5.5.
>

According to the ili2117a/2118a datasheet I have, there are still a
few loose ends.
Some of these might be too inconsequential to worry about.
Dmitry, tell me which ones you think are important, if any,
and I will spin a patch if you like. Or you can do it, just let me know.

>       { "ili210x", (long)&ili210x_chip },
>       { "ili2117", (long)&ili211x_chip },
>       { "ili251x", (long)&ili251x_chip },
>
>       { .compatible = "ilitek,ili210x", .data = &ili210x_chip },
>       { .compatible = "ilitek,ili2117", .data = &ili211x_chip },
>       { .compatible = "ilitek,ili251x", .data = &ili251x_chip },

My datasheet says ILI2117A/ILI2118A, so maybe the compatible string should
really be "ilitek,ili211x", just like the other variants ?

In addition, should we add ili2117/ili2118 in comments somewhere, so others
can find this driver with a simple grep?

>       error = devm_device_add_group(dev, &ili210x_attr_group);
>       if (error) {
>               dev_err(dev, "Unable to create sysfs attributes, err: %d\n",
>                       error);
>               return error;
>       }

The ili2117/ili2118 does not have a calibrate register, so this sysfs group
is unsupported and perhaps may even be harmful if touched (?).

Perhaps add a flag to struct ili2xxx_chip ?

>       input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
>       input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);

The max position on ili2117/8 is 0xfff. The OS I'm using (Android) likes to know
the correct min and max. So it can map touch coords to pixel coords.

Perhaps add this to struct ili2xxx_chip ?

>       /* Get firmware version */
>       error = chip->read_reg(client, REG_FIRMWARE_VERSION,
>                              &firmware, sizeof(firmware));

On ili2117/ili2118, the firmware version register is different (0x03), and
the layout is different too:

byte    name
0       vendor id
1       reserved
2       firmware version upper
3       firmware version lower
4       reserved
5       reserved
6       reserved
7       reserved

But, does it even make sense to retrieve the firmware version? All it's used
for is a dev_dbg log print, which under normal circumstances is a noop:

>       dev_dbg(dev,
>               "ILI210x initialized (IRQ: %d), firmware version %d.%d.%d",
>               client->irq, firmware.id, firmware.major, firmware.minor);

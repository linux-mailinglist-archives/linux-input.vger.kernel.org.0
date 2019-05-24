Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B8729177
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 09:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388964AbfEXHFt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 24 May 2019 03:05:49 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41336 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388934AbfEXHFt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 03:05:49 -0400
Received: by mail-qk1-f193.google.com with SMTP id m18so5901232qki.8
        for <linux-input@vger.kernel.org>; Fri, 24 May 2019 00:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=awBE3R6MaFliHdZCh3cBgGkjYreG0txG8Lteb87Xiyg=;
        b=k4FNKz9xVhF8TjQoPB2bS4UO1/oQwvQfoqaqm8+K0qZVhNZJ9V89qi3riu2Ulva9Au
         SReByuAf3scxmSvcOzb+TDP3ym+xmos5kFrAsssORuetc28G8QLdrcag/e5PvI8Eg28r
         ZGvT8dLEZAA+D+5FxUII55stxrs2SE1ccgd0en0P1pgblX8dy0LjhT/6Lrbf0Adnflyi
         8dv9YwKom8TK4ja9HbwGPOQBsIGaw75l6ufssx1RXc2c9DQH5hMGenWJ2PLQw4xDkZsA
         dIYECvy0KOH0Kdft85VnKo4+BH9OmVLVVOIfCjc6JXmLPMb0gqfj0EO2YHKICoFt8Srk
         8olw==
X-Gm-Message-State: APjAAAWo5PcWIyGmV9AoHLzkwy8Yww2AMlf4tNe0AaasA4OUb/SSlucX
        JufEbz4f9aCvVwJ9GZLGOg2pY4eA7dWv6GLCdk0w2A==
X-Google-Smtp-Source: APXvYqzEqHGLSARrvwBrdDvw232GTj/gPZc+E9LYUyp/feCZjZOmnGjw6Y+kT9XzG0LrToqWr9SAYN8MvMLXYZNpFlw=
X-Received: by 2002:ac8:875:: with SMTP id x50mr83396994qth.345.1558681548800;
 Fri, 24 May 2019 00:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-10-benjamin.tissoires@redhat.com> <003d01d511de$9da229c0$d8e67d40$@emc.com.tw>
In-Reply-To: <003d01d511de$9da229c0$d8e67d40$@emc.com.tw>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 24 May 2019 09:05:37 +0200
Message-ID: <CAO-hwJLnjxVxdodqAkKdQpqjAPGV1QYnugM+9t_86xRD92WJ-Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value
To:     =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 5:13 AM 廖崇榮 <kt.liao@emc.com.tw> wrote:
>
> Hi Benjamin,
>
> Thanks so much for all you do for Elan touchpad.
>
> For the width_*, I have a question for it.
> Our antenna sensors fully occupied the whole touchpad PCB.
>
> The Gap between 2 sensors are 7.5 mil (0.19mm).
> That's why we did not minus one trace.

So, with the P52 I have:
[  +0.000009] max:    (3045,1731) drivers/input/mouse/elan_i2c_core.c:428
[  +0.000003] traces: (24,14) drivers/input/mouse/elan_i2c_core.c:429
[  +0.000002] size:   (98,55) drivers/input/mouse/elan_i2c_core.c:430
[  +0.000001] res:    (31,31) drivers/input/mouse/elan_i2c_core.c:431

calculated size (max/res): 98 x 56 mm
true size, as measured: 101 x 60 mm

Which gives (without the minus 1):
width_x = max_x / x_traces = 3045 / 24 = 126.875 -> 3.9885 mm
width_y = max_y / y_traces = 1731 / 14 = 123.643 -> 4.0927 mm

-> this gives a total size of the touchpad of: 96 x 57 mm (width_x *
24, width_y * 14)

With the minus 1:
width_x = max_x / x_traces = 3045 / 23 = 132.391 -> 4.2707 mm
width_y = max_y / y_traces = 1731 / 14 = 133.154 -> 4.2953 mm

-> this gives a total size of the touchpad of: 102 x 60 mm (width_x *
24, width_y * 14)
and considering traces-1: 98 x 56 mm

Removing 1 to the number of traces gave a squarer values in rows and
columns, and this is what is done in the PS/2 driver.
Also, going back to the size of the touchpad gives a better value when
removing 1 on the *traces.
So maybe when forwarding the properties we should remove one there in
the PS/2 driver?

Cheers,
Benjamin

>
>
> Thanks
> KT
> -----Original Message-----
> From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> Sent: Tuesday, May 21, 2019 9:27 PM
> To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Benjamin Tissoires
> Subject: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base
> value
>
> *_traces are the number of antennas. width_* is thus the space between 2
> antennas. Which means, we should subtract 1 to the number of antennas to
> divide the touchpad by the number of holes between each antenna.
>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> --
>
> new in v2
> ---
>  drivers/input/mouse/elan_i2c_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c
> b/drivers/input/mouse/elan_i2c_core.c
> index 6f4feedb7765..3375eaa9a72e 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -398,8 +398,8 @@ static int elan_query_device_parameters(struct
> elan_tp_data *data)
>                 if (error)
>                         return error;
>         }
> -       data->width_x = data->max_x / x_traces;
> -       data->width_y = data->max_y / y_traces;
> +       data->width_x = data->max_x / (x_traces - 1);
> +       data->width_y = data->max_y / (y_traces - 1);
>
>         if (device_property_read_u32(&client->dev,
>                                      "touchscreen-x-mm", &x_mm) ||
> --
> 2.21.0
>

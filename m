Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DBD2940D
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389958AbfEXJAK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 24 May 2019 05:00:10 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:57457 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389281AbfEXJAK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:00:10 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="30745731"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 24 May 2019 17:00:05 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(43690:0:AUTH_RELAY)
        (envelope-from <kt.liao@emc.com.tw>); Fri, 24 May 2019 17:00:06 +0800 (CST)
Received: from 192.168.81.85
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(119329:1:AUTH_LOGIN)
        (envelope-from <kt.liao@emc.com.tw>); Fri, 24 May 2019 17:00:05 +0800 (CST)
From:   =?utf-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
To:     "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>
Cc:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Aaron Ma'" <aaron.ma@canonical.com>,
        "'Hans de Goede'" <hdegoede@redhat.com>,
        "'open list:HID CORE LAYER'" <linux-input@vger.kernel.org>,
        "'lkml'" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com> <20190521132712.2818-10-benjamin.tissoires@redhat.com> <003d01d511de$9da229c0$d8e67d40$@emc.com.tw> <CAO-hwJLnjxVxdodqAkKdQpqjAPGV1QYnugM+9t_86xRD92WJ-Q@mail.gmail.com>
In-Reply-To: <CAO-hwJLnjxVxdodqAkKdQpqjAPGV1QYnugM+9t_86xRD92WJ-Q@mail.gmail.com>
Subject: RE: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value
Date:   Fri, 24 May 2019 17:00:05 +0800
Message-ID: <011a01d5120f$146265e0$3d2731a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQMBv+jJqV7WAwqWtnh8gdestIYR9QG8pxroARb1rQ4CO3i8JKP4GQng
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcOTIwNzNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01MWM0ODdlOC03ZTAyLTExZTktYjdjYy01YzUxNGY0NmFhNDVcYW1lLXRlc3RcNTFjNDg3ZWEtN2UwMi0xMWU5LWI3Y2MtNWM1MTRmNDZhYTQ1Ym9keS50eHQiIHN6PSI0MjQyIiB0PSIxMzIwMzE2MjAwNDk5Mzk0OTYiIGg9ImpUWTc3NGdIUjRmdFhNM3BhQkx1STBETndXST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

-----Original Message-----
From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com] 
Sent: Friday, May 24, 2019 3:06 PM
To: 廖崇榮
Cc: Dmitry Torokhov; Rob Herring; Aaron Ma; Hans de Goede; open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value

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

I list layout information of P52 touchpad as below.
Physical size : 99 x 58 mm
Active Area size : ~ 97 * 56 mm, (boarding is 1.008mm for each side)

Sensor layout:
X Pitch : 4.0286 mm
Y Pitch : 4.0147 mm

Which gives (without the minus 1):
width_x = max_x / x_traces = 3045 / 24 = 126.875 -> 3.9885 mm width_y = max_y / y_traces = 1731 / 14 = 123.643 -> 4.0927 mm

-> this gives a total size of the touchpad of: 96 x 57 mm (width_x *
24, width_y * 14)

With the minus 1:
width_x = max_x / x_traces = 3045 / 23 = 132.391 -> 4.2707 mm width_y = max_y / y_traces = 1731 / 14 = 133.154 -> 4.2953 mm

-> this gives a total size of the touchpad of: 102 x 60 mm (width_x *
24, width_y * 14)
and considering traces-1: 98 x 56 mm

Removing 1 to the number of traces gave a squarer values in rows and columns, and this is what is done in the PS/2 driver.
Also, going back to the size of the touchpad gives a better value when removing 1 on the *traces.
So maybe when forwarding the properties we should remove one there in the PS/2 driver?

Removing 1 trace may be better for some of previous touchpad. (depending on sensor pattern)
mk_* indicate the number of trace which is touched, and it's not a precise value.
I think the usability won't change too much whether removing one trace.
PS/2 have supported plenty of touchpad. It's better to remain the same.

Thanks
KT

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
> Subject: [PATCH v2 09/10] Input: elan_i2c - correct the width/size 
> base value
>
> *_traces are the number of antennas. width_* is thus the space between 
> 2 antennas. Which means, we should subtract 1 to the number of 
> antennas to divide the touchpad by the number of holes between each antenna.
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

